import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      final email = event.email;
      final password = event.password;

      try {
        // password validation
        if (email.length < 6) {
          emit(const AuthFailure('Password must be 6 Character long'));
        }

        // password validation
        if (password.length < 6) {
          return emit(const AuthFailure('Password must be 6 Character long'));
        }

        //on no error
        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthSuccess(uid: '$email-$password'));
        });
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
}
