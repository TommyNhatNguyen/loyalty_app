import 'package:equatable/equatable.dart';
import 'package:loyalty_app/dto/member_dto.dart';

sealed class MemberEvent extends Equatable {
  const MemberEvent();
  @override
  List<Object?> get props => [];
}

class MemberFetchDetailEvent extends MemberEvent {
  final String id;
  final MemberDetailDTO? payload;
  const MemberFetchDetailEvent({required this.id, this.payload});

  @override
  List<Object?> get props => [id, payload];
}

class MemberFetchListEvent extends MemberEvent {
  final int page;
  final int pageSize;

  const MemberFetchListEvent({this.page = 1, this.pageSize = 10});

  @override
  List<Object?> get props => [page, pageSize];
}
