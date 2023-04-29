import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_state/ui/view/login/login_view.dart';

void main() {
  testWidgets('login view test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginView()));

    final fieldEmail = find.byKey(const ValueKey('field.email'));
    final fieldPaas = find.byKey(const ValueKey('field.pass'));

    await tester.enterText(fieldEmail, 'eee@rrr.rr');
    await tester.enterText(fieldPaas, '12345');

    await tester.pump();

    expect(find.text('eee@rrr.rr'), findsOneWidget);
    expect(find.text('12345'), findsOneWidget);
  });
}
