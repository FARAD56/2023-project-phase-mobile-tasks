import 'package:meta/meta.dart';
import 'package:todolist/features/todo/domain/entities/task.dart';

@immutable
abstract class TaskState {
  const TaskState([List props = const <dynamic>[]]) : super();
}

class Empty extends TaskState {}

class Loading extends TaskState {}

class Loaded extends TaskState {
  final Task task;

  Loaded({required this.task}) : super([task]);
}

class Error extends TaskState {
  final String message;

  Error({required this.message}) : super([message]);
}
