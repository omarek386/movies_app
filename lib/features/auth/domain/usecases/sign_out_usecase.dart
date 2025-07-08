import 'package:movies_app/core/constants/app_data_types.dart';

import '../repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository repository;

  SignOutUsecase(this.repository);

  VoidResponse call() async {
    return await repository.signOut();
  }
}
