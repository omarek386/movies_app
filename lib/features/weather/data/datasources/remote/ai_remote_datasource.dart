import 'package:weather_app/core/errors/exceptions.dart';
import 'package:weather_app/core/network/api_consumer.dart';
import 'package:weather_app/features/weather/data/models/ai_prams_model.dart';

import '../../../../../core/constants/endpoint_constants.dart';

class AiRemoteDatasource {
  final ApiConsumer apiConsumer;
  AiRemoteDatasource(this.apiConsumer);

  Future<dynamic> sendAiParams(AiPramsModel aiParams) async {
    try {
      final response = await apiConsumer.post(
        EndpointConstants.aiBaseUrl + EndpointConstants.aiPredict,
        body: {
          'features': aiParams.toList(),
        },
      );
      return response['prediction'];
    } catch (e) {
      throw ServerException('Failed to send AI parameters: $e');
    }
  }
}
