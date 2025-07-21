import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/features/weather/data/models/auto_complete.dart';
import 'package:movies_app/features/weather/data/models/suggestions.dart';
import 'package:movies_app/features/weather/data/models/weather_forecast_model.dart';

import '../../../../../core/constants/api_keys.dart';
import '../../../../../core/constants/endpoint_constants.dart';
import '../../../../../core/network/api_consumer.dart';
import '../weather_remote_datasource.dart';

class WeatherRemoteDatasource implements WeatherDataSource {
  final ApiConsumer apiConsumer;

  WeatherRemoteDatasource(this.apiConsumer);
  @override
  Future<WeatherForecastModel> getWeatherForecast(String location) async {
    try {
      final response = await apiConsumer.get(
        EndpointConstants.weatherBaseUrl + EndpointConstants.forecast,
        queryParameters: {
          'q': location,
          'days': 3,
          'key': ApiKeys.weatherApiKey,
        },
      );
      final WeatherForecastModel weatherForecastModel =
          WeatherForecastModel.fromJson(response);
      return weatherForecastModel;
    } on DioException catch (e) {
      throw ServerException('Failed to fetch weather forecast: ${e.message}');
    } catch (e) {
      throw ServerException('An unexpected error occurred: $e');
    }
  }

  @override
  Future<List<Suggestions>> autoCompleteSearch(String? query) async {
    try {
      final response = await apiConsumer.get(
        EndpointConstants.weatherBaseUrl + EndpointConstants.autoCompleteSearch,
        queryParameters: {
          'q': query,
          'key': ApiKeys.weatherApiKey,
        },
      );
      final List<Suggestions> suggestionsList =
          AutoComplete.fromJson(response).suggestions;
      return suggestionsList;
    } on DioException catch (e) {
      throw ServerException(
          'Failed to fetch autocomplete suggestions: ${e.message}');
    } catch (e) {
      throw ServerException('An unexpected error occurred: $e');
    }
  }
}
