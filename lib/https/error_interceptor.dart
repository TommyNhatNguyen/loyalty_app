import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class ErrorInterceptor extends Interceptor {
  final GoRouter _router;

  ErrorInterceptor({required GoRouter router}) : _router = router;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    final shouldRedirect = statusCode != null && statusCode >= 500 ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError;

    if (shouldRedirect) {
      _router.go('/error');
    }

    handler.next(err);
  }
}
