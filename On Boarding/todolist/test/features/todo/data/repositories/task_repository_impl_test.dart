import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/core/platform/network_info.dart';
import 'package:todolist/features/todo/data/datasources/task_local_data_source.dart';
import 'package:todolist/features/todo/data/datasources/task_remote_data_source.dart';
import 'package:todolist/features/todo/data/repositories/task_repository_impl.dart';

class MockRemoteDataSource extends Mock implements TaskRemoteDataSource {}

class MockLocalDataSource extends Mock implements TaskLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  TaskRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  // setUp(() {
  mockRemoteDataSource = MockRemoteDataSource();
  mockLocalDataSource = MockLocalDataSource();
  mockNetworkInfo = MockNetworkInfo();
  repository = TaskRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo);
  // });

  group('ViewTask', () {
    // final tTodoModel = TodoModel(
    //     title: 'title',
    //     description: 'description',
    //     deadLine: '2024-11-11',
    //     id: 1);
    // final Task tTask = tTodoModel;

    test('Device Online check', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repository.viewTask(1);
      verify(mockNetworkInfo.isConnected);
    });
  });

  group('Device Online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
  });

  group('Device Offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test('', () {});
  });
}
