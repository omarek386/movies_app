import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel() : super();

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    // TODO: Map JSON to model
    return AuthModel();
  }
}
