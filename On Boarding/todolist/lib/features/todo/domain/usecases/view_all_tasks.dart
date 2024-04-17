import 'package:dartz/dartz.dart';
import 'package:todolist/core/error/failures.dart';
import 'package:todolist/core/usecases/usecase.dart';
import 'package:todolist/features/todo/domain/repositories/task_repository.dart';

class ViewAllTasks extends UseCase<List, String> {

  final TaskRepository repository;
  ViewAllTasks(this.repository);

  @override
  Future<Either<Failure, List>> call(params) async {
    return await repository.viewAllTasks();
  }
}
