import 'package:dartz/dartz.dart' hide Task;
import 'package:todolist/core/error/failures.dart';
import 'package:todolist/core/usecases/usecase.dart';
import 'package:todolist/features/todo/domain/entities/Task.dart';
import 'package:todolist/features/todo/domain/repositories/task_repository.dart';

class ViewTask implements UseCase<Task,int>{
  final TaskRepository repository;
  ViewTask(this.repository);

  @override
  Future<Either<Failure, Task>> call(int id) async {
    return await repository.viewTask(id);
  }
}
