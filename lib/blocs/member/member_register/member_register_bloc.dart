import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/blocs/member/member_register/member_register_event.dart';
import 'package:loyalty_app/blocs/member/member_register/member_register_state.dart';
import 'package:loyalty_app/constants/enums.dart';
import 'package:loyalty_app/services/member_services.dart';

class MemberRegisterBloc
    extends Bloc<MemberRegisterEvent, MemberRegisterState> {
  final MemberServices memberServices = MemberServices();

  MemberRegisterBloc() : super(const MemberRegisterState()) {
    on<MemberRegisterSubmitEvent>(_onSubmit);
  }

  Future<void> _onSubmit(
    MemberRegisterSubmitEvent event,
    Emitter<MemberRegisterState> emit,
  ) async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final payload = event.payload;
      if (payload == null) {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            message: 'Payload is required',
          ),
        );
        return;
      }
      final response = await memberServices.createMember(payload);
      if (response.success) {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            message: response.message,
            exception: null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            message: response.message,
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          exception: e,
          message: e.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          exception: Exception(e.toString()),
          message: e.toString(),
        ),
      );
    }
  }
}
