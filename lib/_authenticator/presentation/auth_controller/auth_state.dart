// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/auth_base_use_case/auth_use_case.dart';
import '../../domain/auth_entites/auth_entits.dart';

class AuthState extends Equatable {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final AuthModel? authModel;

  String? errorMessage;

  AuthState(
      {
        this.authModel ,
        this.errorMessage ,
        required this.emailController,
      required this.passwordController,
      });

  AuthState copyWith(
          {  AuthModel ? authModel,
          String? errorMessage,
          TextEditingController? emailController,
          TextEditingController? passwordController}) =>
      AuthState(
          authModel: authModel ?? this.authModel,
          errorMessage: errorMessage ?? this.errorMessage,
          emailController: emailController ?? this.emailController,
          passwordController: passwordController ?? this.passwordController);

  @override
  List<Object?> get props =>
      [authModel, passwordController, emailController, errorMessage];
}
