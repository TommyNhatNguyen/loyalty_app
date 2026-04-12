import 'package:equatable/equatable.dart';
import 'package:loyalty_app/dto/login_dto.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();
  @override
  List<Object?> get props => [];
}

class SignInSubmitEvent extends SignInEvent {
  final LoginDto payload;
  const SignInSubmitEvent({required this.payload});

  @override
  List<Object?> get props => [payload];
}
