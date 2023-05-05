import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_state/infrastructure/helpers/validations_field.dart';
import 'package:getx_state/ui/view/register/register_view.dart';

void main() {
  testWidgets('register view test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterView()));

    final fieldName = find.byKey(const ValueKey('field.name'));
    final fieldEmail = find.byKey(const ValueKey('field.email'));
    final fieldPhone = find.byKey(const ValueKey('field.phone'));
    final fieldPaas = find.byKey(const ValueKey('field.pass'));

    await tester.enterText(fieldName, 'eko');
    await tester.enterText(fieldEmail, 'eee@rrr.rr');
    await tester.enterText(fieldPhone, '09987654');
    await tester.enterText(fieldPaas, '12345');

    await tester.pump();

    expect(find.text('eko'), findsOneWidget);
    expect(find.text('09987654'), findsOneWidget);
    expect(find.text('eee@rrr.rr'), findsOneWidget);
    expect(find.text('12345'), findsOneWidget);
  });

  test('field validation test', () {
    expect(ValidationsField.required('ekoss', 'name'), null);
    expect(ValidationsField.required('', 'name'), 'Field name tidak boleh kosong');
  });
}
