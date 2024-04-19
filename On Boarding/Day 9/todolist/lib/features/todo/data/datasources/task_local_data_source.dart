import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/core/error/failures.dart';
import 'package:todolist/features/todo/data/models/todo_model.dart';

abstract class TaskLocalDataSource {
  Future<void> cacheTask(TodoModel taskToCache);
  Future<TodoModel> viewTask(int id);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheTask(TodoModel taskToCache) async {
    sharedPreferences.setString('todo.json', json.encode(taskToCache));
  }

  @override
  Future<TodoModel> viewTask(int id) async {
    final jsonString = sharedPreferences.getString('todo.json');
    if (jsonString != null) {
      return Future.value(TodoModel.fromJson(json.decode(jsonString)));
    } else {
      throw const CacheFailure(message: 'No such Task');
    }
  }
}
