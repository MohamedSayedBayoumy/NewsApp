// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/auth_entites/auth_entits.dart';

class AuthState extends Equatable {
  var formKeyLogin = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  dynamic showPassword = true;

  final AuthModel? authModel;

  String? errorMessage;

  bool isEmpty = true ;


  void lol(){
    if(phoneController.text.isNotEmpty){
      // setState(() {
        isEmpty = false ;
        print("object") ;
      // });
      // print(/value) ;
    }else{
      // setState(() {
        isEmpty = true ;
      // });
    }
  }



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


  publicError(TextEditingController controller,
      {required String? val, required String ErrorSpace}) {
    if (val!.isEmpty) {
      controller.text;
      return 'Put Your $ErrorSpace';
    }
    return null;
  }

  AuthState(
      {this.authModel,
      this.showPassword = true,
      this.errorMessage,
        this.isEmpty = true ,
      required this.emailController,
      required this.passwordController,
      required this.nameController,
      required this.phoneController});

  AuthState copyWith(
          {AuthModel? authModel,
          String? errorMessage,
          bool? showPassword,
            bool? isEmpty ,
          TextEditingController? nameController,
          TextEditingController? phoneController,
          TextEditingController? emailController,
          TextEditingController? passwordController}) =>
      AuthState(
        isEmpty: isEmpty ?? this.isEmpty,
          showPassword: showPassword ?? this.showPassword,
          authModel: authModel ?? this.authModel,
          errorMessage: errorMessage ?? this.errorMessage,
          nameController: nameController ?? this.nameController,
          phoneController: phoneController ?? this.phoneController,
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
