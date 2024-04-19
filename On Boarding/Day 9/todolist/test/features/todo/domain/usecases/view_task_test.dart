import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/features/todo/domain/entities/task.dart';
import 'package:todolist/features/todo/domain/repositories/task_repository.dart';
import 'package:todolist/features/todo/domain/usecases/view_task.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  ViewTask usecase;
  MockTaskRepository mockTaskRepository;

  // setUp(() {
  mockTaskRepository = MockTaskRepository();
  usecase = ViewTask(mockTaskRepository);
  // });

  final tTask = Task(
      title: 'title',
      description: 'description',
      deadLine: '2024-11-11',
      id: 1);

  test('do abc', () async {
    when(mockTaskRepository.viewTask(1)).thenAnswer((_) async => Right(tTask));

    final result = await usecase(1);

    expect(result, Right(tTask));
    verify(mockTaskRepository.viewTask(1));
  });
}
