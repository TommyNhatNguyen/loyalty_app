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
