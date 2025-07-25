import 'package:weather_app/features/weather/domain/entities/condition_entity.dart';

class DayEntity {
  final double avgtempC;
  final double mintempC;
  final double maxtempC;
  final int dailyWillItRain;
  final ConditionEntity condition;

  DayEntity({
    required this.avgtempC,
    required this.mintempC,
    required this.maxtempC,
    required this.dailyWillItRain,
    required this.condition,
  });
}
