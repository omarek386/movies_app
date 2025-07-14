import 'package:movies_app/features/weather/data/models/subModels/location_model.dart';
import 'package:movies_app/features/weather/data/models/weather_forecast_model.dart';

import '../../data/models/suggestions.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherForecastModel forecast;
  final LocationModel location;
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
