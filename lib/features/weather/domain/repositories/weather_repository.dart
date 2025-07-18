import 'package:movies_app/core/utils/app_data_types.dart';
import 'package:movies_app/features/weather/data/models/weather_forecast_model.dart';

import '../../data/models/suggestions.dart';

abstract class WeatherRepository {
  SingleDataResponse<WeatherForecastModel> getWeatherForecast(String? location);

  ListOfDataResponse<Suggestions> getAutoCompleteSuggestions(String? query);

  // SingleDataResponse<Position> getLocationDetails();

  // Future<ConditionModel> getCurrentWeatherCondition(String location);

  // Future<void> saveWeatherData(ForecastdayModel forecastday);

  // Future<List<ForecastdayModel>> getSavedWeatherData();
}
