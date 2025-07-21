import 'package:weather_app/core/utils/app_data_types.dart';

import '../../data/models/weather_forecast_model.dart';

abstract class AIRepository {
  SingleDataResponse<dynamic> getAiPrediction(
      WeatherForecastModel weatherForecast);
}
