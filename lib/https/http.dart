import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loyalty_app/configs/routes.dart';
import 'package:loyalty_app/https/auth_interceptor.dart';
import 'package:loyalty_app/https/error_interceptor.dart';

const storage = FlutterSecureStorage();

final dio =
    Dio(
        BaseOptions(
          baseUrl: dotenv.env['ENVIRONMENT'] == 'dev'
              ? dotenv.env['DEV_API_URL'] ?? ''
              : dotenv.env['PROD_API_URL'] ?? '',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          connectTimeout: const Duration(seconds: 10),
        ),
      )
      ..interceptors.addAll([
        AuthInterceptor(storage: storage, router: router),
        ErrorInterceptor(),
      ]);
