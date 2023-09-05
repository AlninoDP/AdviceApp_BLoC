import 'package:adviceapp/application/pages/advice_page/widgets/advice_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({required String adviceText}) {
    return MaterialApp(
      home: AdviceField(adviceText: adviceText),
    );
  }

  group('AdviceField', () {
    group('should be displayed correctly', () {
      testWidgets(
        'when a short text is given',
        (widgetTester) async {
          const text = 'a';

          await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
          await widgetTester.pumpAndSettle();

          final adviceFieldFinder = find.byType(AdviceField);
          expect(adviceFieldFinder, findsOneWidget);
        },
      );

      testWidgets(
        'when a long text is given',
        (widgetTester) async {
          const text =
              'this text is long, this text is long, this text is long, this text is long, this text is long, this text is long, this text is long, this text is long, this text is long, this text is long, this text is long, this text is long';

          await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
          await widgetTester.pumpAndSettle();

          final adviceFieldFinder = find.byType(AdviceField);
          expect(adviceFieldFinder, findsOneWidget);
        },
      );
      testWidgets(
        'when no text is given',
        (widgetTester) async {
          const text = '';

          await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
          await widgetTester.pumpAndSettle();

          final adviceFieldFinder = find.byType(AdviceField);
          expect(adviceFieldFinder, findsOneWidget);
        },
      );
    });
  });
}
