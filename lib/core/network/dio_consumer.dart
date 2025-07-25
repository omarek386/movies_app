import 'package:dio/dio.dart';
// import '../constants/endpoint_constants.dart';
import 'api_consumer.dart';
import 'interceptors.dart';
// import 'status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      // ..baseUrl = EndpointConstants.baseUrl
      ..responseType = ResponseType.json
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15);

    client.interceptors.add(
      AppInterceptors(),
    );
    client.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
      error: true,
    ));
  }

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  // Implement other methods (post, put, delete)

  void _handleDioError(DioException error) {}

  @override
  Future delete(String path) async {
    try {
      final response = await client.delete(path);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.post(path, data: body);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.put(path, data: body);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }
}
