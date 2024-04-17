import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/features/todo/data/models/todo_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTodoModel = TodoModel(
      title: 'title',
      description: 'description',
      deadLine: '2024-11-11',
      id: 1);

  test(
    'Testing TodoModel',
    () async {
      expect(tTodoModel, isA<TodoModel>());
    },
  );

  group('fromJson', () {
    test(
      'Checking from JSON validity',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('todo.json'));

        final result = TodoModel.fromJson(jsonMap);

        expect(result, isA<TodoModel>());
      },
    );
  });

  group('toJson', () {
    test(
      'Checking to JSON validity',
      () async {

        final result = tTodoModel.toJson();
        
        final expectedMap = {
          "title": "title",
          "description": "description",
          "deadLine": "2024-11-11",
          "id": 1
        };

        expect(result, expectedMap);
      },
    );
  });
}
