import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequest);
    on<AuthLogOutRequested>(_onLogOutReq);
  }

  void _onLogOutReq(AuthLogOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLoginRequest(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    final email = event.email;
    final password = event.password;
    emit(AuthLoading());

    try {
      String p =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(p);
      // password validation
      if (!regExp.hasMatch(email)) {
        emit(const AuthFailure('email is not valid'));
      }

      // password validation
      if (password.length < 6) {
        emit(const AuthFailure('Password must be 6 Character long'));
        return;
      }

      //on no error
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess(uid: '$email-$password'));
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
      return;
    }
  }
}
