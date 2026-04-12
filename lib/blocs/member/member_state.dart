import 'package:equatable/equatable.dart';
import 'package:loyalty_app/constants/enums.dart';
import 'package:loyalty_app/models/member.dart';

final class MemberState extends Equatable {
  const MemberState({
    this.status = RequestStatus.initial,
    this.message,
    this.exception,
    this.member,
  });

  final RequestStatus status;
  final String? message;
  final Exception? exception;
  final Member? member;

  MemberState copyWith({
    RequestStatus? status,
    String? message,
    Exception? exception,
    Member? member,
  }) => MemberState(
    status: status ?? this.status,
    message: message ?? this.message,
    exception: exception ?? this.exception,
    member: member ?? this.member,
  );

  @override
  List<Object?> get props => [status, message, exception, member];
}
