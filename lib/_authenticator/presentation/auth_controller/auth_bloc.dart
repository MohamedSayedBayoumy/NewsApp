// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../core/global/globals.dart';
import '../../domain/auth_base_use_case/login_auth_use_case.dart';
import '../../domain/auth_entites/auth_entits.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authUseCase)
      : super(AuthState(
            emailController: TextEditingController(),
            passwordController: TextEditingController())) {
    on<LoginByEmailAndPasswordEvent>(_loginByEmailAndPasswordEvent);
    on<LoginByFaceBookEvent>(_LoginByFaceBookEvent);
    on<ChangeIconEvent>(_ChangeIconEvent);
  }

  final AuthUseCase authUseCase;

  Future<FutureOr<void>> _loginByEmailAndPasswordEvent(
      LoginByEmailAndPasswordEvent event, Emitter<AuthState> emit) async {
    if (state.formKeyLogin.currentState!.validate()) {
    final result = await authUseCase.login(AuthParameters(
        state.emailController.text, state.passwordController.text));
    result.fold((l) {
      emit(state.copyWith(errorMessage: l.message));
      print("Left : ${l.message}");
    }, (r) {
      emit(state.copyWith(authModel: r));
      print("Right : ${r.message}");
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

  Future<FutureOr<void>> _LoginByFaceBookEvent(
      LoginByFaceBookEvent event, Emitter<AuthState> emit) async {
    final LoginResult result =
        await FacebookAuth.instance.login(loginBehavior: LoginBehavior.webOnly);

    Map<String, dynamic>? user;
    AccessToken? accessToken;
    if (result.status == LoginStatus.success) {
      accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      user = userData;
      print("accessToken : ${accessToken!.token}");
      print("data : $user");
      print("Success To Get Data From FaceBook");
      final request = await authUseCase
          .login(AuthParameters("mandobobo123@gmail.com", "123456"));
      request.fold((l) {
        emit(state.copyWith(errorMessage: l.message));
        print("left : ${l.message}");
      }, (r) {
        emit(state.copyWith(authModel: r));
        print("Right : ${r.message.toString()}");
      });
      await sharedPreferences.setString("name", userData["name"]);
      await sharedPreferences.setString("email", userData["email"]);
      await sharedPreferences.setString("url", userData["url"]);
      await sharedPreferences.setString(
          "applicationId", userData["482067707344686"]);
    } else {
      print("status : ${result.status}");
      print("Error Mohamed: ${result.message}");
    }
  }
}
