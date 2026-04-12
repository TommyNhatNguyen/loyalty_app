import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/blocs/member/member_event.dart';
import 'package:loyalty_app/blocs/member/member_state.dart';
import 'package:loyalty_app/constants/enums.dart';
import 'package:loyalty_app/services/member_services.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final MemberServices memberServices = MemberServices();

  MemberBloc() : super(const MemberState()) {
    on<MemberFetchDetailEvent>(_onFetchDetail);
  }

  Future<void> _onFetchDetail(
    MemberFetchDetailEvent event,
    Emitter<MemberState> emit,
  ) async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final response = await memberServices.getMemberDetail(
        id: event.id,
        payload: event.payload,
      );
      if (response.success) {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            member: response.data,
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
