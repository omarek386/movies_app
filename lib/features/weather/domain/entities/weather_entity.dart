import 'package:movies_app/features/weather/domain/entities/current_entities.dart';
import 'package:movies_app/features/weather/domain/entities/location_entity.dart';
import 'package:movies_app/features/weather/domain/entities/forecast_entity.dart';

class WeatherForecastEntity {
  final LocationEntity location;
  final CurrentEntities current;
  final ForecastEntity forecast;

  WeatherForecastEntity({
    required this.location,
    required this.current,
    required this.forecast,
  });
}
