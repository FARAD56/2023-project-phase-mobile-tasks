import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:todolist/features/todo/data/datasources/task_remote_data_source.dart';
import 'package:todolist/features/todo/data/models/todo_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  TaskRemoteDataSource dataSource;

  mockHttpClient = MockHttpClient();
  dataSource = TaskRemoteDataSourceImpl(client: mockHttpClient);

  group('''Perform Http request with number as the endpoint
   and with application/json-header''', () {
    TodoModel tTodoModel =
        TodoModel.fromJson(json.decode(fixture('todo.json')));

    test('Remote data Source', () async {
      when(mockHttpClient.get(any ?? Uri.parse('::Not valid URI::'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('todo.json'), 200));

      dataSource.viewTask(1);
      verify(mockHttpClient.get(Uri.parse('::Not valid URI::'), headers: {
        'Content-Type': 'application/json',
      }));
    });

    test('Return a TodoModel with http call', () async {
      when(mockHttpClient.get(any ?? Uri.parse('::Not valid URI::'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('todo.json'), 200));

      final result = await dataSource.viewTask(1);
      expect(result, tTodoModel);
    });
  });
}
