import 'package:adviceapp/application/pages/advice_page/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({required String message}) {
    return MaterialApp(
      home: ErrorMessage(message: message),
    );
  }

  group('ErrorMessage', () {
    group(
      'Should be displayed correctly',
      () {
        testWidgets(
          'When no text is given',
          (widgetTester) async {
            const message = '';

            await widgetTester.pumpWidget(widgetUnderTest(message: message));
            await widgetTester.pumpAndSettle();

            final errorMessageFinder = find.byType(ErrorMessage);

            expect(errorMessageFinder, findsOneWidget);
          },
        );
        testWidgets(
          'When short text is given',
          (widgetTester) async {
            const message = 'a';

            await widgetTester.pumpWidget(widgetUnderTest(message: message));
            await widgetTester.pumpAndSettle();

            final errorMessageFinder = find.byType(ErrorMessage);

            expect(errorMessageFinder, findsOneWidget);
          },
        );

        testWidgets(
          'When a long text is given',
          (widgetTester) async {
            const message =
                'this is a long text, this is a long text, this is a long text, this is a long text, this is a long text, this is a long text, this is a long text';

            await widgetTester.pumpWidget(widgetUnderTest(message: message));
            await widgetTester.pumpAndSettle();

            final errorMessageFinder = find.byType(ErrorMessage);

            expect(errorMessageFinder, findsOneWidget);
          },
        );
      },
    );
  });
}
