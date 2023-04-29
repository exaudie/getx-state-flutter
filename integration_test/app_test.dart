import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_state/application/my_app.dart';
import 'package:getx_state/ui/view/home/home_view.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Scroll login view', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: MyApp()));

      await tester.pumpAndSettle();

      final scrollFinder = find.byKey(const ValueKey('scroll.login'));
      final toRegister = find.byKey(const ValueKey('btntxt.register'));

      await tester.dragUntilVisible(
        toRegister,
        scrollFinder,
        const Offset(0, -500),
      );

      expect(scrollFinder, findsOneWidget);
      expect(toRegister, findsOneWidget);
    });

    testWidgets('Scroll home view', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeView()));

      await tester.pumpAndSettle();

      final scrollFinder = find.byKey(const ValueKey('main.scroll'));
      final elementFinder = find.text('Privacy Policy');

      await tester.dragUntilVisible(
        elementFinder,
        scrollFinder,
        const Offset(0, -500),
      );

      expect(elementFinder, findsOneWidget);
    });
  });
}
