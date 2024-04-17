import 'package:todolist/features/todo/data/models/todo_model.dart';

abstract class TaskLocalDataSource {
  Future<TodoModel> viewTask(int id);
  Future<List> viewAllTasks();
  Future<String> createTask();
  Future<void> cacheTask(TodoModel triviaToCache);
}
