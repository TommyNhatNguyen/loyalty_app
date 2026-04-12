import 'package:dio/dio.dart';
import 'package:loyalty_app/dto/api_response.dart';
import 'package:loyalty_app/dto/member_dto.dart';
import 'package:loyalty_app/https/http.dart';
import 'package:loyalty_app/models/member.dart';
import 'package:loyalty_app/models/paginate_result.dart';

class MemberServices {
  final Dio http = dio;
  MemberServices();

  Future<ApiResponse<Member>> getMemberDetail({
    required String id,
    MemberDetailDTO? payload,
  }) async {
    try {
      final response = await http.get(
        '/v1/members/$id',
        queryParameters: payload?.toJson(),
      );
      final data = response.data;
      return ApiResponse.success(
        data: Member.fromJson(data['data']),
        message: data['message'],
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return ApiResponse.fromDioException(e);
    }
  }

  Future<ApiResponse<PaginateResult<Member>>> getMemberList({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await http.post(
        '/v1/members/list',
        queryParameters: {'page': page, 'page_size': pageSize},
      );
      return ApiResponse.success(
        data: PaginateResult.fromJson(response.data, Member.fromJson),
        message: response.data['message'],
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return ApiResponse.fromDioException(e);
    }
  }
}
