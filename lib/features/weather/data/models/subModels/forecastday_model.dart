import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/weather/data/models/subModels/astro_model.dart';
import 'package:movies_app/features/weather/data/models/subModels/current_model.dart';
import 'package:movies_app/features/weather/data/models/subModels/day_model.dart';
part 'forecastday_model.g.dart';

@JsonSerializable()
class ForecastdayModel {
  @JsonKey(name: "date")
  final DateTime date;
  @JsonKey(name: "date_epoch")
  final int dateEpoch;
  @JsonKey(name: "day")
  final DayModel day;
  @JsonKey(name: "astro")
  final AstroModel astro;
  @JsonKey(name: "hour")
  final List<CurrentModel> hour;

  ForecastdayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastdayModelToJson(this);
}
