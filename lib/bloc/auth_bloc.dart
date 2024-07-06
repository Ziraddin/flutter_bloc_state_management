import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(
      (event, emit) async {
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds: 1));

        if (event.password.length > 6) {
          return emit(AuthSuccess(uid: "${event.email} - ${event.password}"));
        }
        emit(AuthFailure(error: "Password cannot be less than 6 characters"));
      },
    );

    on<AuthLogOutRequested>(
      (event, emit) async {
        emit(AuthLoading());
        Future.delayed(const Duration(seconds: 1));
        emit(AuthInitial());
      },
    );
  }
}
