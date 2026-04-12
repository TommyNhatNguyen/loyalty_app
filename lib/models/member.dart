import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loyalty_app/models/store.dart';
import 'package:loyalty_app/models/user.dart';

part 'member.g.dart';

@JsonSerializable()
class Member extends Equatable {
  final String id;
  final String? first_name;
  final String last_name;
  final String? email;
  final String? phone;
  final int? gender;
  final bool? is_owner;
  final String? user_id;
  final String? store_id;
  final String? created_by_id;
  final DateTime? created_at;
  final DateTime? updated_at;
  final DateTime? deleted_at;
  final bool? deleted;
  final User? user;
  final Store? store;
  final List<Store>? owned_stores;
  final User? created_by;

  const Member({
    required this.id,
    required this.last_name,
    this.first_name,
    this.email,
    this.phone,
    this.gender,
    this.is_owner,
    this.user_id,
    this.store_id,
    this.created_by_id,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.deleted,
    this.user,
    this.store,
    this.owned_stores,
    this.created_by,
  });

  factory Member.fromJson(Map<String, dynamic> json) =>
      _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);

  @override
  List<Object?> get props => [
    id,
    first_name,
    last_name,
    gender,
    user_id,
    email,
    phone,
    is_owner,
    store_id,
    created_by_id,
    created_at,
    updated_at,
    deleted_at,
    deleted,
    user,
    store,
    owned_stores,
    created_by,
  ];
}
