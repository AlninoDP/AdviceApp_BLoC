import 'package:adviceapp/application/pages/advice_page/advice_page.dart';
import 'package:adviceapp/application/pages/advice_page/cubit/advicer_cubit.dart';
import 'package:adviceapp/application/pages/advice_page/widgets/advice_field.dart';
import 'package:adviceapp/application/pages/advice_page/widgets/error_message.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAdvicerCubit extends MockCubit<AdvicerState>
    implements AdvicerCubit {}

void main() {
  Widget widgetUnderTest({required AdvicerCubit cubit}) {
    return MaterialApp(
      home: BlocProvider<AdvicerCubit>(
        create: (context) => cubit,
        child: const AdvicePage(),
      ),
    );
  }

  group('AdvicePage', () {
    late AdvicerCubit mockAdvicerCubit;
    setUp(
      () {
        mockAdvicerCubit = MockAdvicerCubit();
      },
    );

    group('should be display state', () {
      testWidgets(
        'Initial when cubit emits AdvicerInitial',
        (widgetTester) async {
          whenListen(mockAdvicerCubit, Stream.fromIterable([AdvicerInitial()]),
              initialState: AdvicerInitial());

          await widgetTester
              .pumpWidget(widgetUnderTest(cubit: mockAdvicerCubit));

          final advicerInitialTextFinder =
              find.text('Your Advice is Waiting For You !');
          expect(advicerInitialTextFinder, findsOneWidget);
        },
      );
      testWidgets(
        'Loading when cubit emits AdvicerStateLoading',
        (widgetTester) async {
          whenListen(
              mockAdvicerCubit, Stream.fromIterable([AdvicerStateLoading()]),
              initialState: AdvicerInitial());

          await widgetTester
              .pumpWidget(widgetUnderTest(cubit: mockAdvicerCubit));
          await widgetTester.pump();

          final advicerLoadingFinder = find.byType(CircularProgressIndicator);
          expect(advicerLoadingFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Loaded when cubit emits AdvicerStateLoaded',
        (widgetTester) async {
          whenListen(mockAdvicerCubit,
              Stream.fromIterable(const [AdvicerStateLoaded(advice: 'advice')]),
              initialState: AdvicerInitial());

          await widgetTester
              .pumpWidget(widgetUnderTest(cubit: mockAdvicerCubit));
          await widgetTester.pump();

          final advicerLoadedTextFinder = find.textContaining('advice');
          final advicerLoadedTextFinder1 = find.byType(AdviceField);
          final adviceTextFinder = widgetTester
              .widget<AdviceField>(find.byType(AdviceField))
              .adviceText;
          expect(advicerLoadedTextFinder, findsOneWidget);
          expect(advicerLoadedTextFinder1, findsOneWidget);
          expect(adviceTextFinder, 'advice');
        },
      );
      testWidgets(
        'Loading when cubit emits AdvicerStateError',
        (widgetTester) async {
          whenListen(mockAdvicerCubit,
              Stream.fromIterable([const AdvicerStateError(errorMsg: 'error')]),
              initialState: AdvicerInitial());

          await widgetTester
              .pumpWidget(widgetUnderTest(cubit: mockAdvicerCubit));
          await widgetTester.pump();

          final advicerErrorTextFinder = find.byType(ErrorMessage);
          expect(advicerErrorTextFinder, findsOneWidget);
        },
      );
    });
  });
}
