import 'package:meta/meta.dart';
import 'package:todolist/features/todo/domain/entities/task.dart';

@immutable
abstract class TaskEvent {
  const TaskEvent([List props = const <dynamic>[]]) : super();
}

class GetSingleTaskEvent extends TaskEvent {
  final String idString;

  GetSingleTaskEvent({required this.idString}) : super([idString]);
}

class LoadAllTasksEvent extends TaskEvent {
  final List<Task> tasks;

  LoadAllTasksEvent({required this.tasks}) : super([tasks]);
}

class CreateTaskEvent extends TaskEvent {
  final String id, title, description, deadline;

  CreateTaskEvent(this.title, this.description, this.deadline, {required this.id}) : super([id]);
}

class UpdateTaskEvent extends TaskEvent {
  final String id, title, description, deadline;

  UpdateTaskEvent(this.title, this.description, this.deadline, {required this.id}) : super([id]);
}

class DeleteTaskEvent extends TaskEvent {
  final String id;

  DeleteTaskEvent({required this.id}) : super([id]);
}
