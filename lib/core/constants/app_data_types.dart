import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../errors/failures.dart';

typedef VoidResponse = Future<Either<Failure, void>>;
typedef UserResponse = Future<Either<Failure, UserCredential>>;
typedef StringResponse = Future<Either<Failure, String>>;
