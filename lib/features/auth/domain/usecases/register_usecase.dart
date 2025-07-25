import 'package:weather_app/core/constants/app_data_types.dart';

import '../repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  UserResponse call(String email, String password, String name) async {
    return await repository.register(email, password, name);
  }
}
