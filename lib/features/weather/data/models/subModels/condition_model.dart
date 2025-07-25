import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/domain/entities/condition_entity.dart';
part 'condition_model.g.dart';

@JsonSerializable()
class ConditionModel extends ConditionEntity {
  @JsonKey(name: "text")
  final String text;
  @JsonKey(name: "icon")
  final String icon;
  @JsonKey(name: "code")
  final int code;

  ConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  }) : super(icon: icon);

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}
