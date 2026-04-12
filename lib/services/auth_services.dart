import 'package:dio/dio.dart';
import 'package:loyalty_app/dto/api_response.dart';
import 'package:loyalty_app/dto/login_dto.dart';
import 'package:loyalty_app/https/http.dart';

class AuthServices {
  final Dio http = dio;
  AuthServices();

  Future<ApiResponse<Map<String, dynamic>>> login(LoginDto dto) async {
    try {
      final response = await http.post('/v1/users/login', data: dto.toJson());
      final data = response.data;
      return ApiResponse.success(
        data: data['data'],
        message: data['message'],
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return ApiResponse.fromDioException(e);
    }
  }
}
