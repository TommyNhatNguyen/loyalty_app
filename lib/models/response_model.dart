import 'package:equatable/equatable.dart';

class ResponseModel<T> extends Equatable {
  final T? data;
  final String? message;
  final int? statusCode;

  const ResponseModel({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      data: json['data'],
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }

  @override
  List<Object?> get props => [data, message, statusCode];
}
