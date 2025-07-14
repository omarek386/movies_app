import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/weather/data/models/subModels/forecastday_model.dart';
part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
  @JsonKey(name: "forecastday")
  final List<ForecastdayModel> forecastday;

  ForecastModel({
    required this.forecastday,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
