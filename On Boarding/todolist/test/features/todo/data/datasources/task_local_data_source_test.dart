import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/features/todo/data/datasources/task_local_data_source.dart';
import 'package:todolist/features/todo/data/models/todo_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TaskLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {});

  mockSharedPreferences = MockSharedPreferences();
  dataSource =
      TaskLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);

  group('ViewTask', () {
    final tTodoModel = TodoModel.fromJson(json.decode(fixture('todo.json')));
    test('View Task Test', () async {
      when(mockSharedPreferences.getString(any ?? 'todo.json'))
          .thenReturn(fixture('todo.json'));

      final result = await dataSource.viewTask(1);
      verify(mockSharedPreferences.getString('todo.json'));
      expect(result, tTodoModel);
    });
  });

  group('cache Task', () {
    final tTodoModel = TodoModel(
        title: 'title',
        description: 'description',
        deadLine: 'deadLine',
        id: 1);
    test('Cache Task test', () async {
      dataSource.cacheTask(tTodoModel);

      final expectedJsonString = json.encode(tTodoModel.toJson());
      verify(mockSharedPreferences.setString('todo.json', expectedJsonString));
    });
  });
}
