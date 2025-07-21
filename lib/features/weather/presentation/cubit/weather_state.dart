import 'package:movies_app/features/weather/domain/entities/location_entity.dart';
import 'package:movies_app/features/weather/domain/entities/permission_entity.dart';
import 'package:movies_app/features/weather/domain/entities/weather_entity.dart';

import '../../data/models/suggestions.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherForecastEntity forecast;
  final LocationEntity location;
  final int? aiPrediction;
  WeatherSuccess(this.forecast, this.location, [this.aiPrediction]);
}

class WeatherFailure extends WeatherState {
  final String message;
  final int? statusCode;
  WeatherFailure(this.message, [this.statusCode]);
}

class WeatherSuggestionsState extends WeatherState {
  final List<Suggestions> suggestions;
  WeatherSuggestionsState(this.suggestions);
}

class WeatherSuggestionsLoading extends WeatherState {}

class WeatherSuggestionsFailure extends WeatherState {
  final String message;
  WeatherSuggestionsFailure(this.message);
}

class WeatherSignOutState extends WeatherState {
  final String message;
  WeatherSignOutState(this.message);
}

class WeatherPermissionRequired extends WeatherState {
  final PermissionEntity permission;

  WeatherPermissionRequired(this.permission);

  // Convenience getters for backward compatibility
  String get message => permission.message;
  bool get isPermanentlyDenied => permission.isDeniedForever;
  bool get isServiceDisabled => permission.isServiceDisabled;
  bool get canOpenSettings => permission.canOpenSettings;
}
