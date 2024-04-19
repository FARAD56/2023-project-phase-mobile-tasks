import 'package:dartz/dartz.dart' hide Task;
import 'package:todolist/core/error/failures.dart';
import 'package:todolist/features/todo/domain/entities/task.dart';

abstract class TaskRepository{
  Future<Either<Failure, Task>> createTask(String title, String description, String deadline);
  Future<Either<Failure, List>> viewAllTasks();
  Future<Either<Failure, Task>> viewTask(int id);
}
