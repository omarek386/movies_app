import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/weather/data/models/subModels/current_model.dart';
import 'package:movies_app/features/weather/data/models/subModels/forecast_model.dart';
import 'package:movies_app/features/weather/data/models/subModels/location_model.dart';
import 'package:movies_app/features/weather/domain/entities/weather_entity.dart';
part 'weather_forecast_model.g.dart';

@JsonSerializable()
class WeatherForecastModel extends WeatherForecastEntity {
  @JsonKey(name: "location")
  final LocationModel location;
  @JsonKey(name: "current")
  final CurrentModel current;
  @JsonKey(name: "forecast")
  final ForecastModel forecast;

  WeatherForecastModel({
    required this.location,
    required this.current,
    required this.forecast,
  }) : super(
          current: current,
        );

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastModelToJson(this);
}
