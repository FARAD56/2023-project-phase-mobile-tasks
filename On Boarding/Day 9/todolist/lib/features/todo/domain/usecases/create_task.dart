import 'package:dartz/dartz.dart' hide Task;
import 'package:todolist/core/error/failures.dart';
import 'package:todolist/core/usecases/usecase.dart';
import 'package:todolist/features/todo/domain/entities/task.dart';
import 'package:todolist/features/todo/domain/repositories/task_repository.dart';

class CreateTask extends UseCase<Task, Task> {
  final TaskRepository repository;
  CreateTask(this.repository);

  @override
  Future<Either<Failure, Task>> call(Task params) async {
    return await repository.createTask(params.title, params.description, params.deadLine);
  }
}
