import 'package:adviceapp/application/pages/advice_page/widgets/advice_button.dart';
import 'package:adviceapp/application/pages/advice_page/widgets/advice_field.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adviceapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('tap AdviceButton, verivy advice will be loaded',
        (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      // Verify the initial state, no advice will be loaded
      expect(find.text('Your Advice is Waiting For You !'), findsOneWidget);

      // Find the AdviceButton
      final adviceButtonFinder = find.byType(AdviceButton);

      // Emulate Button Tap
      await widgetTester.tap(adviceButtonFinder);

      // Trigger a frame and wait until settle
      await widgetTester.pumpAndSettle();

      // Verify Advice Loaded
      expect(find.byType(AdviceField), findsOneWidget);
    });
  });
}
