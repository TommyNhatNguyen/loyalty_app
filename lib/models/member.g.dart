// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
  id: json['id'] as String,
  last_name: json['last_name'] as String,
  first_name: json['first_name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  gender: (json['gender'] as num?)?.toInt(),
  is_owner: json['is_owner'] as bool?,
  user_id: json['user_id'] as String?,
  store_id: json['store_id'] as String?,
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
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  store: json['store'] == null
      ? null
      : Store.fromJson(json['store'] as Map<String, dynamic>),
  owned_stores: (json['owned_stores'] as List<dynamic>?)
      ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
      .toList(),
  created_by: json['created_by'] == null
      ? null
      : User.fromJson(json['created_by'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.first_name,
  'last_name': instance.last_name,
  'email': instance.email,
  'phone': instance.phone,
  'gender': instance.gender,
  'is_owner': instance.is_owner,
  'user_id': instance.user_id,
  'store_id': instance.store_id,
  'created_by_id': instance.created_by_id,
  'created_at': instance.created_at?.toIso8601String(),
  'updated_at': instance.updated_at?.toIso8601String(),
  'deleted_at': instance.deleted_at?.toIso8601String(),
  'deleted': instance.deleted,
  'user': instance.user,
  'store': instance.store,
  'owned_stores': instance.owned_stores,
  'created_by': instance.created_by,
};
