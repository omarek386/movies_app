import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/Locatoin/geolocation.dart';
import '../../domain/entities/permission_entity.dart';
import '../../domain/repositories/location_permission_repository.dart';

class LocationPermissionRepositoryImpl implements LocationPermissionRepository {
  @override
  Future<Either<Failure, PermissionEntity>> checkLocationPermission() async {
    try {
      final permission = await Geolocator.checkPermission();
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return const Right(PermissionEntity(
          status: PermissionStatus.serviceDisabled,
          message:
              'Location services are disabled. Enable them to get weather data for your current location.',
          canOpenSettings: true,
        ));
      }

      switch (permission) {
        case LocationPermission.denied:
          return const Right(PermissionEntity(
            status: PermissionStatus.denied,
            message:
                'Location permission is needed to get weather data for your current location.',
          ));
        case LocationPermission.deniedForever:
          return const Right(PermissionEntity(
            status: PermissionStatus.deniedForever,
            message:
                'Location permissions are permanently denied. Enable location access in settings.',
            canOpenSettings: true,
          ));
        case LocationPermission.whileInUse:
        case LocationPermission.always:
          return const Right(PermissionEntity(
            status: PermissionStatus.granted,
            message: 'Location permission granted.',
          ));
        default:
          return const Right(PermissionEntity(
            status: PermissionStatus.denied,
            message: 'Location permission status unknown.',
          ));
      }
    } catch (e) {
      return Left(ServerFailure(
          'Failed to check location permission: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PermissionEntity>> requestLocationPermission() async {
    try {
      // First check current status
      final currentCheck = await checkLocationPermission();
      if (currentCheck.isLeft()) return currentCheck;

      final currentPermission = currentCheck.fold((l) => null, (r) => r);
      if (currentPermission == null) {
        return Left(ServerFailure('Failed to check current permission status'));
      }

      // If service is disabled, return that state
      if (currentPermission.isServiceDisabled) {
        return Right(currentPermission);
      }

      // If already granted, return that state
      if (currentPermission.isGranted) {
        return Right(currentPermission);
      }

      // If permanently denied, can't request again
      if (currentPermission.isDeniedForever) {
        return Right(currentPermission);
      }

      // Request permission
      final requestedPermission = await Geolocation.requestPermission();

      switch (requestedPermission) {
        case LocationPermission.denied:
          return const Right(PermissionEntity(
            status: PermissionStatus.denied,
            message:
                'Location permission was denied. You can try again or enable it manually in settings.',
            canOpenSettings: true,
          ));
        case LocationPermission.deniedForever:
          return const Right(PermissionEntity(
            status: PermissionStatus.deniedForever,
            message:
                'Location permissions are permanently denied. Please enable location access in settings.',
            canOpenSettings: true,
          ));
        case LocationPermission.whileInUse:
        case LocationPermission.always:
          return const Right(PermissionEntity(
            status: PermissionStatus.granted,
            message: 'Location permission granted successfully!',
          ));
        default:
          return Left(ServerFailure('Unknown permission result'));
      }
    } catch (e) {
      return Left(ServerFailure(
          'Failed to request location permission: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> openAppSettings() async {
    try {
      final opened = await Geolocation.openAppSettings();
      return Right(opened);
    } catch (e) {
      return Left(
          ServerFailure('Failed to open app settings: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> isLocationServiceEnabled() async {
    try {
      final enabled = await Geolocator.isLocationServiceEnabled();
      return Right(enabled);
    } catch (e) {
      return Left(ServerFailure(
          'Failed to check location service status: ${e.toString()}'));
    }
  }
}
