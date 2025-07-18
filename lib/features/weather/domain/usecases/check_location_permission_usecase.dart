import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/permission_entity.dart';
import '../repositories/location_permission_repository.dart';

class CheckLocationPermissionUseCase {
  final LocationPermissionRepository repository;

  CheckLocationPermissionUseCase(this.repository);

  Future<Either<Failure, PermissionEntity>> call() async {
    return await repository.checkLocationPermission();
  }
}
