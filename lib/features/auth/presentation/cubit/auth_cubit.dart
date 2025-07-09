import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/domain/usecases/register_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/verify_email_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._registerUsecase,
    this._signInUsecase,
    this._resetPasswordUsecase,
    this._verifyEmailUsecase,
  ) : super(AuthInitial());
  final RegisterUsecase _registerUsecase;
  final SignInUsecase _signInUsecase;
  final ResetPasswordUsecase _resetPasswordUsecase;
  final VerifyEmailUsecase _verifyEmailUsecase;

  Future<void> logIn({required String email, required String password}) async {
    emit(AuthLoading());
    _signInUsecase.call(email, password).then((value) {
      value.fold(
        (failure) {
          emit(AuthFailure(failure.message));
        },
        (success) {
          emit(AuthSignInSuccess(success));
        },
      );
    });
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    _resetPasswordUsecase.call(email).then((value) {
      value.fold(
        (failure) {
          emit(AuthFailure(failure.message));
        },
        (success) {
          emit(AuthResetPasswordSuccess());
        },
      );
    });
  }

  Future<void> verifyEmail(String email) async {
    emit(AuthLoading());
    _verifyEmailUsecase.call(email).then((value) {
      value.fold(
        (failure) {
          emit(AuthFailure(failure.message));
        },
        (success) {
          emit(AuthVerifyEmailSuccess());
        },
      );
    });
  }

  Future<void> register(String email, String password, String name) async {
    emit(AuthLoading());
    _registerUsecase.call(email, password, name).then((value) {
      value.fold(
        (failure) {
          emit(AuthFailure(failure.message));
        },
        (success) {
          emit(AuthRegisterSuccess(success));
        },
      );
    });
  }
}
