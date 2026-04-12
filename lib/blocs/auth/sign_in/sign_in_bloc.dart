import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/blocs/auth/sign_in/sign_in_event.dart';
import 'package:loyalty_app/blocs/auth/sign_in/sign_in_state.dart';
import 'package:loyalty_app/constants/enums.dart';
import 'package:loyalty_app/https/http.dart';
import 'package:loyalty_app/services/auth_services.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthServices authServices = AuthServices();

  SignInBloc() : super(const SignInState()) {
    on<SignInSubmitEvent>(_onSubmit);
  }

  Future<void> _onSubmit(
    SignInSubmitEvent event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final response = await authServices.login(event.payload);
      if (response.success) {
        final accessToken = response.data?['accessToken'];
        final refreshToken = response.data?['refreshToken'];
        if (accessToken != null) {
          await storage.write(key: 'accessToken', value: accessToken);
          await storage.write(key: 'refreshToken', value: refreshToken);
        } else {
          await storage.delete(key: 'accessToken');
          await storage.delete(key: 'refreshToken');
        }
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
