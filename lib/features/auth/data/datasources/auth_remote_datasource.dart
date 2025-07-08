import '../../../../core/constants/app_data_types.dart';

abstract class AuthRemoteDataSource {
  UserResponse signIn(String email, String password);
  VoidResponse signOut();
  UserResponse register(String email, String password, String name);
  VoidResponse resetPassword(String email);
  VoidResponse verifyEmail(String email);
}
