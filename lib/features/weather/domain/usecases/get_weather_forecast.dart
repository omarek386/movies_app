import 'package:movies_app/core/utils/app_data_types.dart';

import '../../data/models/weather_forecast_model.dart';
import '../repositories/weather_repository.dart';

class GetWeatherForecastUseCase {
  final WeatherRepository repository;

  GetWeatherForecastUseCase(this.repository);

  SingleDataResponse<WeatherForecastModel> call(String? location) async {
    return await repository.getWeatherForecast(location);
  }
}
