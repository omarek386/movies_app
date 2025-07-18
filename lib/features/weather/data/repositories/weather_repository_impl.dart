import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/services/Locatoin/geolocation.dart';
import 'package:movies_app/core/utils/app_data_types.dart';
import 'package:movies_app/features/weather/data/models/suggestions.dart';

import 'package:movies_app/features/weather/data/models/weather_forecast_model.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  // @override
  // SingleDataResponse<Position> getLocationDetails() async {
  //   try {
  //     final position = await Geolocator.getCurrentPosition();
  //     return Right(position);
  //   }
  //   on Exception catch (e) {
  //     return Left(ServerFailure('Failed to get location: $e'));
  //   } on Error catch (e) {
  //     return Left(ServerFailure('Failed to get location: $e'));
  //   }
  // }

  @override
  SingleDataResponse<WeatherForecastModel> getWeatherForecast(
      String? location) async {
    try {
      if (location == null || location.isEmpty) {
        final position = await Geolocation.getCurrentPosition();
        location = '${position.latitude},${position.longitude}';
      }
      final weatherForecast =
          await remoteDataSource.getWeatherForecast(location);
      return Right(weatherForecast);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on Exception catch (e) {
      return Left(ServerFailure('Failed to get weather forecast: $e'));
    } on Error catch (e) {
      return Left(ServerFailure('Failed to get weather forecast: $e'));
    }
  }

  @override
  ListOfDataResponse<Suggestions> getAutoCompleteSuggestions(
      String? query) async {
    try {
      final suggestions = await remoteDataSource.autoCompleteSearch(query);
      return Right(suggestions);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          'Failed to get auto-complete suggestions: ${e.message}'));
    } on Exception catch (e) {
      return Left(ServerFailure('Failed to get auto-complete suggestions: $e'));
    } on Error catch (e) {
      return Left(ServerFailure('Failed to get auto-complete suggestions: $e'));
    }
  }
}
