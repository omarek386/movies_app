import 'package:weather_app/core/utils/app_data_types.dart';
import 'package:weather_app/features/weather/domain/repositories/ai_repository.dart';

import '../../data/models/weather_forecast_model.dart';

class GetAiPredictUsecase {
  final AIRepository aiRepository;

  GetAiPredictUsecase(this.aiRepository);

  SingleDataResponse<dynamic> call(WeatherForecastModel weatherForecast) async {
    return await aiRepository.getAiPrediction(weatherForecast);
  }
}
