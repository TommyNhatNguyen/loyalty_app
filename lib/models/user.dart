import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String id;
  final String? username;
  final bool? is_active;
  final DateTime? created_at;
  final DateTime? updated_at;
  final DateTime? deleted_at;
  final bool? deleted;

  const User({
    required this.id,
    this.username,
    this.is_active,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.deleted,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
    id,
    username,
    is_active,
    created_at,
    updated_at,
    deleted_at,
    deleted,
  ];
}
