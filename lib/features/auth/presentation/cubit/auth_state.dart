import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignInSuccess extends AuthState {
  final UserCredential userCredential;
  AuthSignInSuccess(this.userCredential);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

class AuthRegisterSuccess extends AuthState {
  final UserCredential userCredential;
  AuthRegisterSuccess(this.userCredential);
}

class AuthResetPasswordSuccess extends AuthState {}

class AuthVerifyEmailSuccess extends AuthState {}
