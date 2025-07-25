import 'package:weather_app/features/weather/domain/entities/forecastday_entity.dart';

class ForecastEntity {
  final List<ForecastdayEntity> forecastday;

  ForecastEntity({
    required this.forecastday,
  });
}
