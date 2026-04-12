// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
  id: json['id'] as String,
  name: json['name'] as String?,
  name_normalize: json['name_normalize'] as String?,
  description: json['description'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  owner_id: json['owner_id'] as String?,
  created_by_id: json['created_by_id'] as String?,
  created_at: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updated_at: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deleted_at: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  deleted: json['deleted'] as bool?,
);

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'name_normalize': instance.name_normalize,
  'description': instance.description,
  'address': instance.address,
  'phone': instance.phone,
  'owner_id': instance.owner_id,
  'created_by_id': instance.created_by_id,
  'created_at': instance.created_at?.toIso8601String(),
  'updated_at': instance.updated_at?.toIso8601String(),
  'deleted_at': instance.deleted_at?.toIso8601String(),
  'deleted': instance.deleted,
};
