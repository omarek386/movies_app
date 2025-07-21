import 'package:weather_app/features/weather/domain/entities/day_entity.dart';
import 'package:weather_app/features/weather/domain/entities/astro_entity.dart';

class ForecastdayEntity {
  final DateTime date;
  final DayEntity day;
  final AstroEntity astro;

  ForecastdayEntity({
    required this.date,
    required this.day,
    required this.astro,
  });
}
