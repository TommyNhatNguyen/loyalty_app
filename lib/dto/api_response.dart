import 'package:dio/dio.dart';

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final int? statusCode;

  const ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.statusCode,
  });

  factory ApiResponse.success({
    T? data,
    String? message,
    int? statusCode,
  }) {
    return ApiResponse(
      success: true,
      data: data,
      message: message,
      statusCode: statusCode,
    );
  }

  factory ApiResponse.error({
    String? message,
    int? statusCode,
  }) {
    return ApiResponse(
      success: false,
      message: message,
      statusCode: statusCode,
    );
  }

  factory ApiResponse.fromDioException(DioException e) {
    final response = e.response;
    final data = response?.data;
    return ApiResponse(
      success: false,
      message: data is Map<String, dynamic>
          ? data['message'] as String?
          : e.message,
      statusCode: response?.statusCode,
    );
  }
}
