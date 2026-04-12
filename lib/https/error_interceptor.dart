import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    final shouldToast =
        statusCode != null && statusCode >= 500 ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError;

    if (shouldToast) {
      final response = err.response;
      final message =
          response?.data['message'] ??
          response?.statusMessage ??
          'An error occurred';
      toastification.show(title: Text(message), type: ToastificationType.error);
    }

    handler.next(err);
  }
}
