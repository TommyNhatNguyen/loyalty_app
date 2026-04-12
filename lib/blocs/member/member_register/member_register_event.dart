import 'package:equatable/equatable.dart';
import 'package:loyalty_app/dto/member_dto.dart';

sealed class MemberRegisterEvent extends Equatable {
  const MemberRegisterEvent();
  @override
  List<Object?> get props => [];
}

class MemberRegisterSubmitEvent extends MemberRegisterEvent {
  final MemberCreateDTO? payload;
  const MemberRegisterSubmitEvent({this.payload});

  @override
  List<Object?> get props => [payload];
}
