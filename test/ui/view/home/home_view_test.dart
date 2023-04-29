import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_state/ui/view/home/home_view.dart';

void main() {
  testWidgets('Home view scroll test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeView()));

    final scrollFinder = find.byKey(const ValueKey('main.scroll'));
    final elementFinder = find.text('Privacy Policy');

    await tester.dragUntilVisible(
      elementFinder,
      scrollFinder,
      const Offset(0, -100),
    );

    expect(elementFinder, findsOneWidget);
  });
}
