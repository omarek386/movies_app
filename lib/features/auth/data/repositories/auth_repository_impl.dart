import 'package:movies_app/core/constants/app_data_types.dart';

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
    return await remoteDataSource.signIn(email, password);
  }

  @override
  VoidResponse signOut() async {
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
