// ignore_for_file: must_be_immutable

import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/auth_base_use_case/auth_use_case.dart';
import '../../domain/auth_entites/auth_entits.dart';

class AuthState extends Equatable {
  var formKeyLogin = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  dynamic showPassword = true;

  final AuthModel? authModel;

  String? errorMessage;

  errorEmail(TextEditingController controller,
      {required String val, required String ErrorSpace}) {
    !EmailValidator.validate(val) ? 'Put Your $ErrorSpace' : null;
    if (val.isEmpty) {
      controller.text;
      return 'Put Your $ErrorSpace';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val)) {
      return 'Must Your Email include @example.com';
    }
    return null;
  }

  errorPassword(TextEditingController controller,
      {required String? val, required String ErrorSpace}) {
    if (val!.isEmpty) {
      controller.text;
      return 'Put Your $ErrorSpace';
    }
    if (controller.text.length < 6) {
      controller.text;
      return 'you should but a least 6 letter';
    }
    return null;
  }

  AuthState({
    this.authModel,
    this.showPassword = true,
    this.errorMessage,
    required this.emailController,
    required this.passwordController,
  });

  AuthState copyWith(
          {AuthModel? authModel,
          String? errorMessage,
          bool? showPassword,
          TextEditingController? emailController,
          TextEditingController? passwordController}) =>
      AuthState(
          showPassword: showPassword ?? this.showPassword,
          authModel: authModel ?? this.authModel,
          errorMessage: errorMessage ?? this.errorMessage,
          emailController: emailController ?? this.emailController,
          passwordController: passwordController ?? this.passwordController);

  @override
  List<Object?> get props => [
        authModel,
        passwordController,
        emailController,
        errorMessage,
        showPassword
      ];
}
