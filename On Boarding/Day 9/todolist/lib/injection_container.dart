import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/core/network/network_info.dart';
import 'package:todolist/core/util/input_converter.dart';
import 'package:todolist/features/todo/data/datasources/task_local_data_source.dart';
import 'package:todolist/features/todo/data/datasources/task_remote_data_source.dart';
import 'package:todolist/features/todo/data/repositories/task_repository_impl.dart';
import 'package:todolist/features/todo/domain/repositories/task_repository.dart';
import 'package:todolist/features/todo/domain/usecases/create_task.dart';
import 'package:todolist/features/todo/domain/usecases/view_all_tasks.dart';
import 'package:todolist/features/todo/domain/usecases/view_task.dart';
import 'package:todolist/features/todo/presentation/bloc/bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(
    () => TaskBloc(Empty(),
        createTask: sl(),
        viewTask: sl(),
        viewAllTasks: sl(),
        inputConverter: sl()),
  );

  sl.registerLazySingleton(() => ViewAllTasks(sl()));
  sl.registerLazySingleton(() => ViewTask(sl()));
  sl.registerLazySingleton(() => CreateTask(sl()));

  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton(() => InputConverter());

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
