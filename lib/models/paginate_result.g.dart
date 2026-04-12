// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  page: (json['page'] as num).toInt(),
  page_size: (json['page_size'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.page_size,
      'total': instance.total,
      'pages': instance.pages,
    };
