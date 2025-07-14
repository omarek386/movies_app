import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/permission_entity.dart';

abstract class LocationPermissionRepository {
  Future<Either<Failure, PermissionEntity>> checkLocationPermission();
  Future<Either<Failure, PermissionEntity>> requestLocationPermission();
  Future<Either<Failure, bool>> openAppSettings();
  Future<Either<Failure, bool>> isLocationServiceEnabled();
}
