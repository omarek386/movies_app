import '../../../../core/constants/app_data_types.dart';
import '../repositories/auth_repository.dart';

class SignInUsecase {
  final AuthRepository repository;

  SignInUsecase(this.repository);

  UserResponse call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}
