import 'package:todolist/features/todo/data/models/todo_model.dart';

abstract class TaskRemoteDataSource{
  Future<String> createTask(String title, String description, String deadline);
  Future<List> viewAllTasks();
  Future<TodoModel> viewTask(int id);
}