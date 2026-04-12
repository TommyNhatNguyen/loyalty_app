import 'package:equatable/equatable.dart';
import 'package:loyalty_app/constants/enums.dart';

final class MemberRegisterState extends Equatable {
  const MemberRegisterState({
    this.status = RequestStatus.initial,
    this.message,
    this.exception,
  });

  final RequestStatus status;
  final String? message;
  final Exception? exception;

  MemberRegisterState copyWith({
    RequestStatus? status,
    String? message,
    Exception? exception,
  }) => MemberRegisterState(
    status: status ?? this.status,
    message: message ?? this.message,
    exception: exception ?? this.exception,
  );

  @override
  List<Object?> get props => [status, message, exception];
}
