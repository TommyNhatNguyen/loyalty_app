import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store extends Equatable {
  final String id;
  final String? name;
  final String? name_normalize;
  final String? description;
  final String? address;
  final String? phone;
  final String? owner_id;
  final String? created_by_id;
  final DateTime? created_at;
  final DateTime? updated_at;
  final DateTime? deleted_at;
  final bool? deleted;

  const Store({
    required this.id,
    this.name,
    this.name_normalize,
    this.description,
    this.address,
    this.phone,
    this.owner_id,
    this.created_by_id,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.deleted,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    name_normalize,
    description,
    address,
    phone,
    owner_id,
    created_by_id,
    created_at,
    updated_at,
    deleted_at,
    deleted,
  ];
}
