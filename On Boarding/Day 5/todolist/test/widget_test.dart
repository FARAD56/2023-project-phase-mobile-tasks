// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/features/presentation/pages/create_new_task.dart';
import 'package:todolist/features/presentation/pages/edit_task.dart';
import 'package:todolist/features/presentation/pages/task_details.dart';
import 'package:todolist/features/presentation/pages/to_do_list.dart';
import 'package:todolist/main.dart';
import 'package:todolist/models/taskclass.dart';

void main() {
  testWidgets('Test main page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MyApp()));
    await tester.pump();

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Test Task Details', (WidgetTester tester) async {
    final key = GlobalKey<NavigatorState>();
    final args = Task('My task', 'abc', '2024-02-11');
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: key,
        home: ElevatedButton(
          child: const SizedBox(),
          onPressed: () => key.currentState?.push(
            MaterialPageRoute<void>(
              settings: RouteSettings(
                arguments: args,
              ),
              builder: (_) => const TaskDetails(),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsNWidgets(6));
    expect(find.byType(Card), findsNWidgets(3));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Test To do list', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ToDoList()));
    await tester.pump();

    expect(find.byType(Icon), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Test Create Task page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CreateTask()));
    await tester.enterText(
        find.byKey(const ValueKey("title")), 'My first Task');
    await tester.enterText(
        find.byKey(const ValueKey("description")), "I'll do abc");
    await tester.tap(find.byKey(const ValueKey('Add Task')));

    expect(find.text('My first Task'), findsOneWidget);
    expect(find.text("I'll do abc"), findsOneWidget);
  });

  testWidgets('Test Edit Task', (WidgetTester tester) async {
    final key = GlobalKey<NavigatorState>();
    final args = Task('My task', 'abc', '2024-02-11');
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: key,
        home: ElevatedButton(
          child: const SizedBox(),
          onPressed: () => key.currentState?.push(
            MaterialPageRoute<void>(
              settings: RouteSettings(
                arguments: args,
              ),
              builder: (_) => const EditTask(),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));

  });
}
