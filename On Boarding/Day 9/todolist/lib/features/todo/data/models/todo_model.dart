import 'package:todolist/features/todo/domain/entities/task.dart';

class TodoModel extends Task {
  TodoModel({
    required super.title,
    required super.description,
    required super.deadLine,
    required super.id,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'deadLine': deadLine,
        'id': id
      };

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'] as String,
      description: json['description'] as String,
      deadLine: json['deadLine'] as String,
      id: json['id'] as int,
    );
  }
}
