import '../../../../core/constants/app_data_types.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository repository;

  ResetPasswordUsecase(this.repository);

  VoidResponse call(String email) async {
    return await repository.resetPassword(email);
  }
}
