import 'package:movies_app/features/weather/domain/entities/location_entity.dart';
import 'package:movies_app/features/weather/domain/entities/weather_entity.dart';

import '../../data/models/suggestions.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherForecastEntity forecast;
  final LocationEntity location;
  WeatherSuccess(this.forecast, this.location);
}

class WeatherFailure extends WeatherState {
  final String message;
  WeatherFailure(this.message);
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
