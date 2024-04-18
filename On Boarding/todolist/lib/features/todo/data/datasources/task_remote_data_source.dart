import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/core/error/failures.dart';
import 'package:todolist/features/todo/data/models/todo_model.dart';

abstract class TaskRemoteDataSource {
  Future<TodoModel> viewTask(int id);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final http.Client client;

  TaskRemoteDataSourceImpl({required this.client});

  @override
  Future<TodoModel> viewTask(int id) async {
    final response = await client.get(Uri.parse('::Not valid URI::'), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw const ServerException(message: 'Something went wrong, 404');
    }
  }
}
