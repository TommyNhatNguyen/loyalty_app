import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loyalty_app/dto/user_dto.dart';

part 'member_dto.g.dart';

enum MemberDetailInclude { user, store, owned_stores, created_by }

@JsonSerializable()
class MemberDetailDTO extends Equatable {
  const MemberDetailDTO({this.include});

  final List<MemberDetailInclude>? include;

  factory MemberDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$MemberDetailDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MemberDetailDTOToJson(this);

  @override
  List<Object?> get props => [include];
}

@JsonSerializable()
class MemberListDTO extends Equatable {
  const MemberListDTO({this.is_owner, this.include});

  final bool? is_owner;
  final List<MemberDetailInclude>? include;

  factory MemberListDTO.fromJson(Map<String, dynamic> json) =>
      _$MemberListDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MemberListDTOToJson(this);

  @override
  List<Object?> get props => [is_owner, include];
}

@JsonSerializable()
class MemberCreateDTO extends Equatable {
  const MemberCreateDTO({
    this.user,
    this.first_name,
    this.last_name,
    this.email,
    this.phone,
    this.gender,
    this.is_owner,
    this.store_id,
    this.created_by_id,
  });

  final UserDTO? user;
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? phone;
  final int? gender;
  final bool? is_owner;
  final String? store_id;
  final String? created_by_id;

  factory MemberCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$MemberCreateDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MemberCreateDTOToJson(this);

  @override
  List<Object?> get props => [
    user,
    first_name,
    last_name,
    email,
    phone,
    gender,
    is_owner,
    store_id,
    created_by_id,
  ];
}

