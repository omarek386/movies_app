import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/data/models/subModels/forecastday_model.dart';
import 'package:weather_app/features/weather/domain/entities/forecast_entity.dart';
part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel extends ForecastEntity {
  @JsonKey(name: "forecastday")
  final List<ForecastdayModel> forecastday;

  ForecastModel({
    required this.forecastday,
  }) : super(forecastday: forecastday);

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
