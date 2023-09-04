import 'package:adviceapp/application/pages/advice_page/cubit/advicer_cubit.dart';
import 'package:adviceapp/domain/entities/advice_entity.dart';
import 'package:adviceapp/domain/failures/failures.dart';
import 'package:adviceapp/domain/usecases/advice_usecase.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceUsecase extends Mock implements AdviceUsecase {}

void main() {
  group('AdvicerCubit', () {
    group('should emit', () {
      MockAdviceUsecase mockAdviceUsecase = MockAdviceUsecase();
      blocTest(
        'emits nothing when no method called',
        build: () => AdvicerCubit(adviceUsecase: mockAdviceUsecase),
        expect: () => const <AdvicerState>[],
      );

      blocTest(
          '[AdvicerStateLoading, AdvicerStateLoaded] when adviceRequested()',
          setUp: () => when(() => mockAdviceUsecase.getAdvice()).thenAnswer(
                (invocation) => Future.value(
                  const Left<AdviceEntity, Failures>(
                    AdviceEntity(id: 1, advice: 'advice'),
                  ),
                ),
              ),
          build: () => AdvicerCubit(adviceUsecase: mockAdviceUsecase),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => <AdvicerState>[
                AdvicerStateLoading(),
                const AdvicerStateLoaded(advice: 'advice')
              ]);

      group(
          '[AdvicerStateLoading, AdvicerStateError] when adviceRequested() is called',
          () {
        blocTest<AdvicerCubit, AdvicerState>(
          'and a server failure occur',
          setUp: () => when(() => mockAdviceUsecase.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              Right<AdviceEntity, Failures>(ServerFailures()),
            ),
          ),
          build: () => AdvicerCubit(adviceUsecase: mockAdviceUsecase),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => <AdvicerState>[
            AdvicerStateLoading(),
            const AdvicerStateError(errorMsg: serverFailuresMessage)
          ],
        );

        blocTest<AdvicerCubit, AdvicerState>(
          'and a server ChaceFailure occur',
          setUp: () => when(() => mockAdviceUsecase.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              Right<AdviceEntity, Failures>(ChacheFailures()),
            ),
          ),
          build: () => AdvicerCubit(adviceUsecase: mockAdviceUsecase),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => <AdvicerState>[
            AdvicerStateLoading(),
            const AdvicerStateError(errorMsg: chacheFailuresMessage)
          ],
        );

        blocTest<AdvicerCubit, AdvicerState>(
          'and a GeneralFailure occur',
          setUp: () => when(() => mockAdviceUsecase.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              Right<AdviceEntity, Failures>(GeneralFailures()),
            ),
          ),
          build: () => AdvicerCubit(adviceUsecase: mockAdviceUsecase),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => <AdvicerState>[
            AdvicerStateLoading(),
            const AdvicerStateError(errorMsg: generalFailuresMessage)
          ],
        );
      });
    });
  });
}
