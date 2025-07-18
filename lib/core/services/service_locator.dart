import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/network/api_consumer.dart';
import 'package:movies_app/core/network/dio_consumer.dart';
import 'package:movies_app/core/utils/app_shared_preferences.dart';
import 'package:movies_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:movies_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:movies_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movies_app/features/weather/data/datasources/remote/weather_remote_datasource.dart';
import 'package:movies_app/features/weather/data/repositories/location_permission_repository_impl.dart';
import 'package:movies_app/features/weather/domain/repositories/location_permission_repository.dart';
import 'package:movies_app/features/weather/domain/usecases/check_location_permission_usecase.dart';
import 'package:movies_app/features/weather/domain/usecases/get_weather_forecast.dart';
import 'package:movies_app/features/weather/domain/usecases/open_app_settings_usecase.dart';
import 'package:movies_app/features/weather/domain/usecases/request_location_permission_usecase.dart';

import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/reset_password_usecase.dart';
import '../../features/auth/domain/usecases/sign_in_usecase.dart';
import '../../features/auth/domain/usecases/sign_out_usecase.dart';
import '../../features/auth/domain/usecases/verify_email_usecase.dart';
import '../../features/weather/data/datasources/weather_remote_datasource.dart';
import '../../features/weather/data/repositories/weather_repository_impl.dart';
import '../../features/weather/domain/repositories/weather_repository.dart';
import '../../features/weather/domain/usecases/get_auto_complete_suggestions_usecase.dart';

final sl = GetIt.instance;

final appPreferences = AppPreferences();

void setup() {
  appPreferences.init();

  sl.registerLazySingleton<AppPreferences>(() => appPreferences);
  //
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Register your use cases
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => FirebaseAuthDatasource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => SignInUsecase(sl()));
  sl.registerLazySingleton(() => SignOutUsecase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUsecase(sl()));
  sl.registerLazySingleton(() => VerifyEmailUsecase(sl()));

  // Weather
  sl.registerLazySingleton(() => GetWeatherForecastUseCase(sl()));
  sl.registerLazySingleton(() => GetAutoCompleteSuggestionsUseCase(sl()));
  sl.registerLazySingleton(() => CheckLocationPermissionUseCase(sl()));
  sl.registerLazySingleton(() => RequestLocationPermissionUseCase(sl()));
  sl.registerLazySingleton(() => OpenAppSettingsUseCase(sl()));
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(sl()));
  sl.registerLazySingleton<LocationPermissionRepository>(
      () => LocationPermissionRepositoryImpl());
  sl.registerLazySingleton<WeatherDataSource>(
      () => WeatherRemoteDatasource(sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<Dio>(() => Dio());
}
