import 'package:equatable/equatable.dart';
import 'package:loyalty_app/constants/enums.dart';

final class SignInState extends Equatable {
  const SignInState({
    this.status = RequestStatus.initial,
    this.message,
    this.exception,
  });

  final RequestStatus status;
  final String? message;
  final Exception? exception;

  SignInState copyWith({
    RequestStatus? status,
    String? message,
    Exception? exception,
  }) => SignInState(
    status: status ?? this.status,
    message: message ?? this.message,
    exception: exception ?? this.exception,
  );

  @override
  List<Object?> get props => [status, message, exception];
}
