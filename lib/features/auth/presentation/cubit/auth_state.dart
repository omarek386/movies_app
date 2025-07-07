abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  // final result;
  // Success(this.result);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
