// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberDetailDTO _$MemberDetailDTOFromJson(Map<String, dynamic> json) =>
    MemberDetailDTO(
      include: (json['include'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MemberDetailIncludeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$MemberDetailDTOToJson(MemberDetailDTO instance) =>
    <String, dynamic>{
      'include': instance.include
          ?.map((e) => _$MemberDetailIncludeEnumMap[e]!)
          .toList(),
    };

const _$MemberDetailIncludeEnumMap = {
  MemberDetailInclude.user: 'user',
  MemberDetailInclude.store: 'store',
  MemberDetailInclude.owned_stores: 'owned_stores',
  MemberDetailInclude.created_by: 'created_by',
};

MemberListDTO _$MemberListDTOFromJson(Map<String, dynamic> json) =>
    MemberListDTO(
      is_owner: json['is_owner'] as bool?,
      include: (json['include'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MemberDetailIncludeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$MemberListDTOToJson(MemberListDTO instance) =>
    <String, dynamic>{
      'is_owner': instance.is_owner,
      'include': instance.include
          ?.map((e) => _$MemberDetailIncludeEnumMap[e]!)
          .toList(),
    };

MemberCreateDTO _$MemberCreateDTOFromJson(Map<String, dynamic> json) =>
    MemberCreateDTO(
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      is_owner: json['is_owner'] as bool?,
      store_id: json['store_id'] as String?,
      created_by_id: json['created_by_id'] as String?,
    );

Map<String, dynamic> _$MemberCreateDTOToJson(MemberCreateDTO instance) =>
    <String, dynamic>{
      'user': instance.user,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'is_owner': instance.is_owner,
      'store_id': instance.store_id,
      'created_by_id': instance.created_by_id,
    };
