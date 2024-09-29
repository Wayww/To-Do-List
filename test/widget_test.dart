import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Проверяем, что счетчик начинается с 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Нажимаем на иконку "+" и создаем новый кадр
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Проверяем, что счетчик увеличился до 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
