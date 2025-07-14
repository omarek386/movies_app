import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';

typedef ListOfDataResponse<T> = Future<Either<Failure, List<T>>>;
typedef SingleDataResponse<T> = Future<Either<Failure, T>>;
typedef VoidResponse = Future<Either<Failure, void>>;
typedef BooleanResponse = Future<Either<Failure, bool>>;
typedef StringResponse = Future<Either<Failure, String>>;
typedef IntResponse = Future<Either<Failure, int>>;
