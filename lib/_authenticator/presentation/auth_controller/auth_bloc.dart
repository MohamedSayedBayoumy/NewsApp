// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/global/globals.dart';
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
    on<ChangeIconEvent>(_ChangeIconEvent);
  }

  final AuthUseCase authUseCase;

  Future<FutureOr<void>> _loginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    if (state.formKeyLogin.currentState!.validate()) {
      final result = await authUseCase(AuthParameters(
          state.emailController.text, state.passwordController.text));
      result.fold((l) {
        state.copyWith(errorMessage: l.message);
        print(l.status);
      }, (r) async {
        state.copyWith(authModel: r);
        print(r.status);
        sharedPreferences.setString("token", r.data!["token"]);
      });
    } else {}
  }

  FutureOr<void> _ChangeIconEvent(
      ChangeIconEvent event, Emitter<AuthState> emit) {
    print("first : ${state.showPassword}");
    if (state.showPassword == true) {

      emit(state.copyWith(
          emailController: state.emailController,
          passwordController: state.passwordController,
          showPassword: false));
    } else {

      emit(state.copyWith(
          emailController: state.emailController,
          passwordController: state.passwordController,
          showPassword: true));
    }
  }
}
