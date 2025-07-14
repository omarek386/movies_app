import '../../data/models/subModels/condition_model.dart';

class CurrentEntities {
  final double tempC;
  final ConditionModel condition;
  final int humidity;
  final int cloud;

  CurrentEntities({
    required this.tempC,
    required this.condition,
    required this.humidity,
    required this.cloud,
  });
}
