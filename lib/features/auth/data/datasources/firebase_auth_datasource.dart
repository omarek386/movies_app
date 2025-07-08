import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/errors/failures.dart';

import '../../../../core/constants/app_data_types.dart';
import 'auth_remote_datasource.dart';

class FirebaseAuthDatasource implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthDatasource(this._firebaseAuth);
  @override
  UserResponse register(String email, String password, String name) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await user.user?.updateDisplayName(name);
      // await user.user?.sendEmailVerification();
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(
          e.message ?? 'An error occurred during registration',
        ),
      );
    } on Exception catch (_) {
      return Left(
        ServerFailure(
          'An error occurred during registration',
        ),
      );
    }
  }

  @override
  VoidResponse resetPassword(String email) async {
    try {
      return await _firebaseAuth.sendPasswordResetEmail(email: email).then(
            (value) => const Right(null),
          );
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(
          e.message ?? 'An error occurred while resetting password',
        ),
      );
    } on Exception catch (_) {
      return Left(
        ServerFailure(
          'An error occurred while resetting password',
        ),
      );
    }
  }

  @override
  UserResponse signIn(String email, String password) async {
    try {
      return await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((user) => Right(user));
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(
          e.message ?? 'An error occurred during sign-in',
        ),
      );
    } on Exception catch (_) {
      return Left(
        ServerFailure(
          'An error occurred during sign-in',
        ),
      );
    }
  }

  @override
  VoidResponse signOut() async {
    try {
      return await _firebaseAuth.signOut().then((_) => const Right(null));
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(
          e.message ?? 'An error occurred during sign-out',
        ),
      );
    } on Exception catch (_) {
      return Left(
        ServerFailure(
          'An error occurred during sign-out',
        ),
      );
    }
  }

  @override
  VoidResponse verifyEmail(String email) async {
    try {
      return await _firebaseAuth.currentUser?.sendEmailVerification().then(
                (value) => const Right(null),
              ) ??
          Left(
            ServerFailure('No user is currently signed in'),
          );
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(
          e.message ?? 'An error occurred while verifying email',
        ),
      );
    } on Exception catch (_) {
      return Left(
        ServerFailure(
          'An error occurred while verifying email',
        ),
      );
    }
  }
}
