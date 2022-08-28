import 'package:get_it/get_it.dart';
import 'features/auth/presentation/cubit/login_cubit.dart';
import 'features/new_arrivals/domain/repositories/new_arrivals_repository.dart';
import 'features/new_arrivals/presentation/cubit/new_arrivals_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/local/auth_local_datasource.dart';
import 'core/util/api_basehelper.dart';
import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login.dart';
import 'features/new_arrivals/data/datasources/new_arrivals_remote_datasource.dart';
import 'features/new_arrivals/data/repositories/new_arrivals_repository_impl.dart';
import 'features/new_arrivals/domain/usecases/get_new_arrivals.dart';

final sl = GetIt.instance;
late final SharedPreferences sharedPreferences;
final helper = ApiBaseHelper();
Future<void> init() async {
  //! External
  sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  helper.dioInit();
  sl.registerLazySingleton(() => helper);
  loginInj();
  newArrivalsInj();
  //! Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

void loginInj() {
  //* provider
  sl.registerFactory(
    () => LoginCubit(login: sl()),
  );

  //* Use cases
  // sl.registerLazySingleton(() => ToggleUserBlockState(repository: sl()));
  // sl.registerLazySingleton(() => RegisterUserInformation(repository: sl()));
  sl.registerLazySingleton(() => Login(repository: sl()));

  //* Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remote: sl(), local: sl()),
  );

  //* Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      helper: sl(),
    ),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPreference: sl(),
    ),
  );
}

void newArrivalsInj() {
  //* provider
  sl.registerFactory(
    () => NewArrivalsCubit(getNewArrivals: sl()),
  );

  //* Use cases
  // sl.registerLazySingleton(() => ToggleUserBlockState(repository: sl()));
  // sl.registerLazySingleton(() => RegisterUserInformation(repository: sl()));
  sl.registerLazySingleton(() => GetNewArrivals(repository: sl()));

  //* Repository
  sl.registerLazySingleton<NewArrivalsRepository>(
      () => NewArrivalsRepositoryImpl(remote: sl()));

  //* Data sources
  sl.registerLazySingleton<NewArrivalsRemoteDataSource>(
    () => NewArrivalsRemoteDataSourceImpl(
      helper: sl(),
    ),
  );
}
