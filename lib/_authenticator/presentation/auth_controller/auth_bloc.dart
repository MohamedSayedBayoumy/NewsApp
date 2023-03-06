// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/auth_base_use_case/auth_use_case.dart';
import '../../domain/auth_entites/auth_entits.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authUseCase)
      : super(AuthState(
            emailController: TextEditingController(),
            passwordController: TextEditingController())) {
    on<LoginEvent>(_loginEvent);
  }

  final AuthUseCase authUseCase;

  Future<FutureOr<void>> _loginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    final result = await authUseCase(AuthParameters(
        state.emailController.text, state.passwordController.text));
    result.fold((l) => state.copyWith(errorMessage: l.message), (r) {
      state.copyWith(authModel: r);
      state.authModel!.data!["token"] ;
    });
  }
}
