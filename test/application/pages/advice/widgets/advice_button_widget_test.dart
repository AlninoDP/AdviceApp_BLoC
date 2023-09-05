import 'package:adviceapp/application/pages/advice_page/widgets/advice_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

//* make a callable class
abstract class OnAdviceButtonTap {
  void call();
}

//* mock the callable class
class MockOnAdviceButtonTap extends Mock implements OnAdviceButtonTap {}

void main() {
  Widget widgetUnderTest({Function()? callback}) {
    return MaterialApp(
      home: Scaffold(
        body: AdviceButton(
          onTap: callback,
        ),
      ),
    );
  }

  group('AdviceButton', () {
    group(
      'should render Correctly',
      () {
        testWidgets(
          'and has all part needed',
          (widgetTester) async {
            await widgetTester.pumpWidget(widgetUnderTest());
            final buttonLabelFinder = find.text('Get Advice');
            expect(buttonLabelFinder, findsOneWidget);
          },
        );
      },
    );

    group('should handle onTap', () {
      testWidgets(
        'when someone press the button',
        (widgetTester) async {
          final mockOnAdviceButtonTap = MockOnAdviceButtonTap();
          await widgetTester
              .pumpWidget(widgetUnderTest(callback: mockOnAdviceButtonTap));
          final adviceButtonFinder = find.byType(AdviceButton);

          await widgetTester.tap(adviceButtonFinder);

          verify(mockOnAdviceButtonTap).called(1);
        },
      );
    });
  });
}
