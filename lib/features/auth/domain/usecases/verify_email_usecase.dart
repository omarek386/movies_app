import '../../../../core/constants/app_data_types.dart';
import '../repositories/auth_repository.dart';

class VerifyEmailUsecase {
  final AuthRepository repository;

  VerifyEmailUsecase(this.repository);

  VoidResponse call(String email) async {
    return await repository.verifyEmail(email);
  }
}
