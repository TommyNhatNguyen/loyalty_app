import 'package:dio/dio.dart';
import 'package:loyalty_app/dto/api_response.dart';
import 'package:loyalty_app/https/http.dart';

abstract class BaseService {
  final Dio http = dio;

  Future<ApiResponse<T>> request<T>(
    Future<Response> Function() apiCall,
    T Function(dynamic data) parser,
  ) async {
    try {
      final response = await apiCall();
      final data = response.data;
      return ApiResponse.success(
        data: parser(data),
        message: data['message'],
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return ApiResponse.fromDioException(e);
    }
  }
}
