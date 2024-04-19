import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:todolist/core/error/failures.dart';
import 'package:todolist/core/util/input_converter.dart';
import 'package:todolist/features/todo/domain/entities/task.dart';
import 'package:todolist/features/todo/domain/usecases/create_task.dart';
import 'package:todolist/features/todo/domain/usecases/view_all_tasks.dart';
import 'package:todolist/features/todo/domain/usecases/view_task.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String iNVALID_INPUT_FAILURE =
    'Invalid Input, Number must be a positive iteger';
const String allTasks = 'All tasks';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final CreateTask createTask;
  final ViewTask viewTask;
  final ViewAllTasks viewAllTasks;
  final InputConverter inputConverter;

  TaskBloc(super.initialState,
      {required this.createTask,
      required this.viewTask,
      required this.viewAllTasks,
      required this.inputConverter});

  @override
  TaskState get InitialState => Empty();

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is GetSingleTaskEvent) {
      final inputEither =
          inputConverter.stringToUnsignedInteger(event.idString);

      yield* inputEither.fold((failure) async* {
        yield Error(message: iNVALID_INPUT_FAILURE);
      }, (integer) async* {
        yield Loading();
        final failureOrTask = await viewTask(integer);
        yield* _eitherLoadedOrErrorState(failureOrTask);
      });
    } else if (event is CreateTaskEvent) {
      final failureOrTask = await createTask(Task(
          title: event.title,
          description: event.description,
          deadLine: event.deadline,
          id: int.parse(event.id)));
      yield* _eitherLoadedOrErrorState(failureOrTask);
    } else if (event is UpdateTaskEvent) {
      final inputEither = inputConverter.stringToUnsignedInteger(event.id);

      yield* inputEither.fold((failure) async* {
        yield Error(message: iNVALID_INPUT_FAILURE);
      }, (integer) async* {
        yield Loading();
        final failureOrTask = await viewTask(integer);

        yield* _updateEventLoadedOrErrorState(failureOrTask, event);
      });
    }
  }

  Stream<TaskState> _eitherLoadedOrErrorState(
    Either<Failure, Task> failureOrTask,
  ) async* {
    yield failureOrTask.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (task) => Loaded(task: task),
    );
  }

  Stream<TaskState> _updateEventLoadedOrErrorState(
      Either<Failure, Task> failureOrTask, UpdateTaskEvent event) async* {
    yield failureOrTask.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (task) {
        task.title = event.title;
        task.description = event.description;
        task.deadLine = event.deadline;
        return Loaded(task: task);
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return SERVER_FAILURE_MESSAGE;
    } else if (failure is CacheFailure) {
      return CACHE_FAILURE_MESSAGE;
    } else {
      return 'Unexpected Error';
    }
  }
}
