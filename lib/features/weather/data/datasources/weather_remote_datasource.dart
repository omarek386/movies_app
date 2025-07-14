import '../models/suggestions.dart';
import '../models/weather_forecast_model.dart';

abstract class WeatherDataSource {
  Future<WeatherForecastModel> getWeatherForecast(String location);
  Future<List<Suggestions>> autoCompleteSearch(String? query);
}
