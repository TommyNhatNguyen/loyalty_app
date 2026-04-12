import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginate_result.g.dart';

class PaginateResult<T> extends Equatable {
  final List<T> data;
  final String? message;
  final Pagination pagination;

  const PaginateResult({
    required this.data,
    this.message,
    required this.pagination,
  });

  factory PaginateResult.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginateResult(
      data: (json['data'] as List)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      pagination: Pagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );
  }

  @override
  List<Object?> get props => [data, message, pagination];
}

@JsonSerializable()
class Pagination extends Equatable {
  final int page;
  final int page_size;
  final int total;
  final int pages;

  const Pagination({
    required this.page,
    required this.page_size,
    required this.total,
    required this.pages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);

  @override
  List<Object?> get props => [page, page_size, total, pages];
}
