import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  final GoRouter _router;

  AuthInterceptor({
    required FlutterSecureStorage storage,
    required GoRouter router,
  }) : _storage = storage,
       _router = router;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path == '/v1/users/login') {
      handler.next(options);
      return;
    }

    try {
      final token = await _storage.read(key: 'accessToken');

      if (token == null || token.isEmpty) {
        _router.go('/');
        handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.cancel,
            message: 'No access token found.',
          ),
        );
        return;
      }

      if (Jwt.isExpired(token)) {
        await _storage.delete(key: 'accessToken');
        _router.go('/');
        handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.cancel,
            message: 'Access token expired.',
          ),
        );
        return;
      }

      options.headers['Authorization'] = 'Bearer $token';
      handler.next(options);
    } catch (e) {
      _router.go('/');
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.cancel,
          message: 'Auth error: $e',
        ),
      );
    }
  }
}
