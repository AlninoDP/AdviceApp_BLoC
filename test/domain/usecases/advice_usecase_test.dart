import 'package:adviceapp/data/repositories/advice_repository_impl.dart';
import 'package:adviceapp/domain/entities/advice_entity.dart';
import 'package:adviceapp/domain/failures/failures.dart';
import 'package:adviceapp/domain/usecases/advice_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'advice_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepositoryImpl>()])
void main() {
  group('AdviceUsecase', () {
    group('should return AdviceEntity', () {
      test('when AdviceRepositoriesImpl return AdviceModel', () async {
        final mockAdviceRepositoryImpl = MockAdviceRepositoryImpl();
        final adviceUsecaseUnderTest =
            AdviceUsecase(adviceRepository: mockAdviceRepositoryImpl);

        when(mockAdviceRepositoryImpl.getAdviceFromDatasource()).thenAnswer(
            (realInvocation) => Future.value(
                const Left(AdviceEntity(id: 2, advice: 'advice'))));

        final result = await adviceUsecaseUnderTest.getAdvice();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(
            result,
            const Left<AdviceEntity, Failures>(
                AdviceEntity(id: 2, advice: 'advice')));
        verify(mockAdviceRepositoryImpl.getAdviceFromDatasource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepositoryImpl);
      });
    });
    group('should return Left', () {
      test('with a ServerFailure', () async {
        final mockAdviceRepositoryImpl = MockAdviceRepositoryImpl();
        final adviceUsecaseUnderTest =
            AdviceUsecase(adviceRepository: mockAdviceRepositoryImpl);

        when(mockAdviceRepositoryImpl.getAdviceFromDatasource()).thenAnswer(
            (realInvocation) => Future.value(Right(ServerFailures())));

        final result = await adviceUsecaseUnderTest.getAdvice();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<AdviceEntity, Failures>(ServerFailures()));
        verify(mockAdviceRepositoryImpl.getAdviceFromDatasource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepositoryImpl);
      });
      test('with a GeneralFailure', () async {
        final mockAdviceRepositoryImpl = MockAdviceRepositoryImpl();
        final adviceUsecaseUnderTest =
            AdviceUsecase(adviceRepository: mockAdviceRepositoryImpl);

        when(mockAdviceRepositoryImpl.getAdviceFromDatasource()).thenAnswer(
            (realInvocation) => Future.value(Right(GeneralFailures())));

        final result = await adviceUsecaseUnderTest.getAdvice();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<AdviceEntity, Failures>(GeneralFailures()));
        verify(mockAdviceRepositoryImpl.getAdviceFromDatasource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepositoryImpl);
      });
    });
  });
}
