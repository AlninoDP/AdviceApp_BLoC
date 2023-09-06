import 'package:adviceapp/application/pages/advice_page/widgets/advice_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({Function()? onTap}) {
    return MaterialApp(
      home: Center(
        child: AdviceButton(
          onTap: onTap,
        ),
      ),
    );
  }

  group('Golden Test', () {
    group(
      'AdviceButton',
      () {
        testWidgets(
          'is Enabled',
          (widgetTester) async {
            await widgetTester.pumpWidget(widgetUnderTest(onTap: () {}));

            await expectLater(find.byType(AdviceButton),
                matchesGoldenFile('goldens/advice_button_enabled.png'));
          },
        );
        testWidgets(
          'is Disabled',
          (widgetTester) async {
            await widgetTester.pumpWidget(widgetUnderTest());

            await expectLater(find.byType(AdviceButton),
                matchesGoldenFile('goldens/advice_button_disabled.png'));
          },
        );
      },
    );
  });
}
