import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/utils/app_data_types.dart';
import 'package:weather_app/features/weather/data/models/ai_prams_model.dart';
import 'package:weather_app/features/weather/domain/repositories/ai_repository.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

import '../datasources/remote/ai_remote_datasource.dart';
import '../models/weather_forecast_model.dart';

class AIRepositoryImpl implements AIRepository {
  final WeatherRepository weatherRepository;
  final AiRemoteDatasource aiRemoteDatasource;

  AIRepositoryImpl(this.weatherRepository, this.aiRemoteDatasource);

  @override
  SingleDataResponse<dynamic> getAiPrediction(
      WeatherForecastModel weatherForecast) async {
    try {
      // Get current weather forecast
      final aiParams = _extractAiParamsFromWeather(weatherForecast);
      final response = await aiRemoteDatasource.sendAiParams(aiParams);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Failed to extract AI parameters: $e'));
    }
  }

  /// Extracts AI parameters from weather forecast data
  AiPramsModel _extractAiParamsFromWeather(
      WeatherForecastModel weatherForecast) {
    final current = weatherForecast.current;
    final todayForecast = weatherForecast.forecast.forecastday.isNotEmpty
        ? weatherForecast.forecast.forecastday.first
        : null;

    // Extract temperature data
    final tempC = current.tempC;
    final maxTempC = todayForecast?.day.maxtempC ?? tempC;
    final minTempC = todayForecast?.day.mintempC ?? tempC;

    // Extract precipitation data
    final precipMm = current.precipMm;
    final chanceOfRain = todayForecast?.day.dailyChanceOfRain ?? 0;
    final willItRain = todayForecast?.day.dailyWillItRain ?? 0;

    // Extract condition data
    final conditionText = current.condition.text.toLowerCase();
    final isDay = current.isDay == 1;
    final cloudCover = current.cloud;

    // Determine weather conditions
    final int isRainy =
        _determineIfRainy(precipMm, chanceOfRain, willItRain, conditionText);
    final int isSunny = _determineIfSunny(conditionText, isDay, cloudCover);
    final int isHot = _determineIfHot(tempC, maxTempC);
    final int isMild = _determineIfMild(tempC, maxTempC, minTempC);
    final int isNormal = _determineIfNormal(isRainy, isSunny, isHot, isMild);

    return AiPramsModel(
      isRainy: isRainy,
      isSunny: isSunny,
      isHot: isHot,
      isMild: isMild,
      isNormal: isNormal,
    );
  }

  /// Determines if weather conditions are rainy (0 or 1)
  int _determineIfRainy(
      double precipMm, int chanceOfRain, int willItRain, String conditionText) {
    if (precipMm > 0.1 || willItRain == 1 || chanceOfRain > 50) {
      return 1;
    }

    if (conditionText.contains('rain') ||
        conditionText.contains('shower') ||
        conditionText.contains('drizzle') ||
        conditionText.contains('storm')) {
      return 1;
    }

    return 0;
  }

  /// Determines if weather conditions are sunny (0 or 1)
  int _determineIfSunny(String conditionText, bool isDay, int cloudCover) {
    if (!isDay) return 0;

    if (conditionText.contains('sunny') ||
        conditionText.contains('clear') ||
        (conditionText.contains('partly cloudy') && cloudCover < 30)) {
      return 1;
    }

    return cloudCover < 20 ? 1 : 0;
  }

  /// Determines if temperature is hot (0 or 1)
  int _determineIfHot(double tempC, double maxTempC) {
    // Consider hot if current temp > 30°C or max temp > 32°C
    return (tempC > 30.0 || maxTempC > 32.0) ? 1 : 0;
  }

  /// Determines if temperature is mild (0 or 1)
  int _determineIfMild(double tempC, double maxTempC, double minTempC) {
    // Consider mild if temperature is between 18-28°C
    return (tempC >= 18.0 &&
            tempC <= 28.0 &&
            maxTempC <= 30.0 &&
            minTempC >= 15.0)
        ? 1
        : 0;
  }

  /// Determines if conditions are normal (0 or 1)
  /// Normal means not extreme in any particular way
  int _determineIfNormal(int isRainy, int isSunny, int isHot, int isMild) {
    // Normal if it's not rainy, not too hot, and has mild conditions
    return (isRainy == 0 && isHot == 0 && isMild == 1) ? 1 : 0;
  }
}
