import 'package:dartz/dartz.dart' hide Task;
import 'package:todolist/core/error/failures.dart';
import 'package:todolist/features/todo/domain/entities/task.dart';
import 'package:todolist/features/todo/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  List<Task> tasks = [];
  int counter = 1;
  
  @override
  Future<Either<Failure, String>> createTask(String title, String description, String deadline)async{
    if (title.isNotEmpty && description.isNotEmpty && deadline.isNotEmpty){
    tasks.add(Task(title: title, description: description, deadLine: deadline, id: counter++));
    return const Right('Task Added Successfully');
    }
    else{
      return const Left(Failure(message: 'Task Creation Failed'));
    }
  }

  @override
  Future<Either<Failure, List>> viewAllTasks() async {
    if (tasks.isEmpty) {
      return const Left(Failure(message: 'No tasks available'));
    } else {
      return Right(tasks);
    }
  }

  @override
  Future<Either<Failure, Task>> viewTask(int id) async {
    for (Task task in tasks) {
      if (task.id == id) {
        return Right(task);
      }
    }
    return const Left(Failure(message: 'No such Task'));
  }


}
