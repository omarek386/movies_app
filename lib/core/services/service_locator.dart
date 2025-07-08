import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:movies_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:movies_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repository.dart';

import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/reset_password_usecase.dart';
import '../../features/auth/domain/usecases/sign_in_usecase.dart';
import '../../features/auth/domain/usecases/verify_email_usecase.dart';

final sl = GetIt.instance;

void setup() {
  //
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Register your use cases
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => FirebaseAuthDatasource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => SignInUsecase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUsecase(sl()));
  sl.registerLazySingleton(() => VerifyEmailUsecase(sl()));
}
