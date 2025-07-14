import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/location_permission_repository.dart';

class OpenAppSettingsUseCase {
  final LocationPermissionRepository repository;

  OpenAppSettingsUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.openAppSettings();
  }
}
