import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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
