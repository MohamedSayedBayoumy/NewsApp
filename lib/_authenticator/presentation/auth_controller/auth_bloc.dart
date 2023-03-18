// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_screens/phone_screen.dart';
import 'package:news_app_clean_architecture/home_screen_categories.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/global/globals.dart';
import '../../../test2.dart';
import '../../domain/auth_base_use_case/auth_use_case.dart';
import '../../domain/auth_entites/auth_entits.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authUseCase)
      : super(AuthState(
            nameController: TextEditingController(),
            phoneController: TextEditingController(),
            emailController: TextEditingController(),
            passwordController: TextEditingController())) {
    on<LoginByEmailAndPasswordEvent>(_loginByEmailAndPasswordEvent);
    on<LoginByFaceBookEvent>(_loginByFaceBookEvent);
    on<LoginByGmailEvent>(_loginByGmailEvent);
    on<ChangeIconEvent>(_ChangeIconEvent);
    on<RegisterByFaceBookEvent>(_registerByFaceBookEvent);
    on<RegisterByGmailEvent>(_registerByGmailEvent);
    on<RegisterByEmailAndPasswordEvent>(_RegisterByEmailAndPasswordEvent);
    on<AddPhoneNumberEvent>(_addPhoneNumber);
  }

  final AuthUseCase authUseCase;

  Future<FutureOr<void>> _loginByEmailAndPasswordEvent(
      LoginByEmailAndPasswordEvent event, Emitter<AuthState> emit) async {
    if (state.formKeyLogin.currentState!.validate()) {
      final result = await authUseCase.login(AuthParameters(
          email: state.emailController.text,
          password: state.passwordController.text));
      print("Message : ${result.message}");
    } else {}
  }

  Future<FutureOr<void>> _loginByFaceBookEvent(
      LoginByFaceBookEvent event, Emitter<AuthState> emit) async {
    final LoginResult loginFacebook =
        await FacebookAuth.instance.login(loginBehavior: LoginBehavior.webOnly);

    Map<String, dynamic>? user;
    AccessToken? accessToken;
    if (loginFacebook.status == LoginStatus.success) {
      accessToken = loginFacebook.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      user = userData;
      print("accessToken : ${accessToken!.token}");
      print("data : $user");
      print("Success To Get Data From FaceBook");
      final result = await authUseCase.login(AuthParameters(
          email: userData["email"], password: userData["accessToken"]));
      print("Message : ${result.message}");

      // await sharedPreferences.setString("name", userData["name"]);
      // await sharedPreferences.setString("email", userData["email"]);
      // await sharedPreferences.setString("url", userData["url"]);
      // await sharedPreferences.setString(
      //     "applicationId", userData["482067707344686"]);
    } else {
      print("status : ${loginFacebook.status}");
      print("Error Mohamed: ${loginFacebook.message}");
    }
  }

  Future<FutureOr<void>> _loginByGmailEvent(
      LoginByGmailEvent event, Emitter<AuthState> emit) async {
    final GoogleSignIn signInGoogle = GoogleSignIn();
    signInGoogle.signIn().then((value) async {
      final result = await authUseCase
          .login(AuthParameters(email: value!.email, password: value.id));
      print("Message : ${result.message}");
    });
  }

  Future<FutureOr<void>> _registerByFaceBookEvent(
      RegisterByFaceBookEvent event, Emitter<AuthState> emit) async {}

  Future<FutureOr<void>> _RegisterByEmailAndPasswordEvent(
      RegisterByEmailAndPasswordEvent event, Emitter<AuthState> emit) async {
    if (state.formKeyLogin.currentState!.validate()) {
      final result = await authUseCase.register(AuthParameters(
          email: state.emailController.text,
          password: state.passwordController.text,
          name: state.nameController.text,
          phone: state.phoneController.text));
      print("Message : ${result.message}");
    } else {}
  }

  Future<FutureOr<void>> _registerByGmailEvent(
      RegisterByGmailEvent event, Emitter<AuthState> emit) async {
    final GoogleSignIn signInGoogle = GoogleSignIn();
    final number = Random().nextInt(50000);
    await signInGoogle.signIn().then((value) async {
      if (signInGoogle.currentUser?.serverAuthCode != null) {
        final result = await authUseCase.register(AuthParameters(
            email: signInGoogle.currentUser?.email,
            password: value!.id,
            name: value.displayName,
            phone: number + 3,
            image: value.photoUrl));
        print("Success : ${result}");
        await sharedPreferences.setString("email", value.email);
        await sharedPreferences.setString("password", value.id);
        await sharedPreferences.setString("id", value.id);
        await sharedPreferences.setString("name", value.displayName.toString());
        await sharedPreferences.setString("phone", "0");
        await sharedPreferences.setString("image", value.photoUrl.toString());
        try {
          await sharedPreferences.setString("token", result.data!["token"]);
        } catch (e) {
          print(e);
        }
      } else {
        print("Some Thing Error");
      }
    }).then((value) {
      Navigator.pushAndRemoveUntil(
          event.context,
          PageTransition(
              child: const AddPhoneScreen(),
              type: PageTransitionType.rightToLeft),
          (route) => false);
    });
  }

  Future<FutureOr<void>> _addPhoneNumber(
      AddPhoneNumberEvent event, Emitter<AuthState> emit) async {
    final email = sharedPreferences.getString("email")  ;
    print(email) ;
    final result = await authUseCase
        .addPhoneNumber(AuthParameters(
            email: sharedPreferences.getString("email"),
            password: sharedPreferences.getString("password"),
            name: sharedPreferences.getString("name"),
            phone: state.phoneController.text,
            image: sharedPreferences.getString("image")))
        .then((value) {
      print("Message : ${value.message}");
      Navigator.pushAndRemoveUntil(
          event.context,
          PageTransition(
              child: const HomeScreenCategories(),
              type: PageTransitionType.rightToLeft),
          (route) => false);
    });
    print("Response Add Phone Number : $result") ;
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
