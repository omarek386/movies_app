import 'package:movies_app/features/weather/domain/entities/condition_entity.dart';

class CurrentEntities {
  final double tempC;
  final ConditionEntity condition;
  final int humidity;
  final int cloud;

  CurrentEntities({
    required this.tempC,
    required this.condition,
    required this.humidity,
    required this.cloud,
  });
}
