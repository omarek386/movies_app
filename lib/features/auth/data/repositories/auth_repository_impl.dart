import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/core/constants/app_data_types.dart';
import 'package:weather_app/core/constants/cache_keys.dart';
import 'package:weather_app/core/utils/app_shared_preferences.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  UserResponse register(String email, String password, String name) async {
    final user = await remoteDataSource.register(email, password, name);
    await remoteDataSource.verifyEmail(email);
    return user;
  }

  @override
  UserResponse signIn(String email, String password) async {
    final user = await remoteDataSource.signIn(email, password);
    if (user.isRight()) {
      sl<AppPreferences>().setData(
          CacheKeys.userKey, sl<FirebaseAuth>().currentUser?.displayName);
    }
    return user;
  }

  @override
  VoidResponse signOut() async {
    await sl<AppPreferences>().removeData(CacheKeys.userKey);
    return remoteDataSource.signOut();
  }

  @override
  VoidResponse resetPassword(String email) async {
    return remoteDataSource.resetPassword(email);
  }

  @override
  VoidResponse verifyEmail(String email) async {
    return remoteDataSource.verifyEmail(email);
  }
}
