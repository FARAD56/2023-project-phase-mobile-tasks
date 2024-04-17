import 'package:dartz/dartz.dart' hide Task;
import 'package:todolist/core/error/failures.dart';
import 'package:todolist/core/network/network_info.dart';
import 'package:todolist/features/todo/data/datasources/task_local_data_source.dart';
import 'package:todolist/features/todo/data/datasources/task_remote_data_source.dart';
import 'package:todolist/features/todo/domain/entities/task.dart';
import 'package:todolist/features/todo/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  List<Task> tasks = [];
  int counter = 1;

  TaskRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, String>> createTask(
      String title, String description, String deadline) async {
    if (await networkInfo.isConnected) {
      if (title.isNotEmpty && description.isNotEmpty && deadline.isNotEmpty) {
        tasks.add(Task(
            title: title,
            description: description,
            deadLine: deadline,
            id: counter++));
        return const Right('Task Added Successfully');
      } else {
        return const Left(Failure(message: 'Task Creation Failed'));
      }
    } else {
      return const Left(ServerException(message: 'Server is Offline'));
    }
  }

  @override
  Future<Either<Failure, List>> viewAllTasks() async {
    if (await networkInfo.isConnected) {
      if (tasks.isEmpty) {
        return const Left(Failure(message: 'No tasks available'));
      } else {
        return Right(tasks);
      }
    } else {
      return const Left(ServerException(message: 'Server is Offline'));
    }
  }

  @override
  Future<Either<Failure, Task>> viewTask(int id) async {
    if (await networkInfo.isConnected) {
      try {
        for (Task task in tasks) {
          if (task.id == id) {
            final remoteTask = await remoteDataSource.viewTask(id);
            localDataSource.cacheTask(remoteTask);
            return Right(remoteTask);
          }
        }
        return const Left(Failure(message: 'Task not found'));
      } on ServerException {
        return const Left(ServerException(message: 'Task not found'));
      }
    } else {
      try {
        final localTask = await localDataSource.viewTask(id);
        return Right(localTask);
      } on CacheException {
        return const Left(CacheException(message: 'Task not found'));
      }
    }
  }
}
