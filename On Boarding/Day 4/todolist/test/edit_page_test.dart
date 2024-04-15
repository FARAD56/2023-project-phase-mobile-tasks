import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/features/presentation/pages/edit_task.dart';


void main(){
    testWidgets('Test Edit Task page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: EditTask()));
    await tester.enterText(find.byKey(const ValueKey('edited title')), 'aaa');
    await tester.enterText(
        find.byKey(const ValueKey('edited description')), 'aaa');
    await tester.tap(find.byKey(const ValueKey('Edit Task')));

    expect(find.text('aaa'), findsOneWidget);
    expect(find.text('aaa'), findsOneWidget);
  });
}