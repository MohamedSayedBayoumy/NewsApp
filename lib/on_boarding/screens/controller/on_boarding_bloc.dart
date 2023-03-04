// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_app_clean_architecture/on_boarding/screens/presentation/onboarding_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../../_authenticator/presentation/auth_screens/login_screen.dart';
import '../../../home_screen_categories.dart';
import '../../domain/entitie/entite_model.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingState()) {
    on<SwitchPageViewEvent>(_switchPageViewEvent);
    on<NavigatorToLoginScreen>(_NavigatorToLoginScreen);
  }

  Future<FutureOr<void>> _switchPageViewEvent(
      SwitchPageViewEvent event, Emitter<OnBoardingState> emit) async {
    if (state.turn == 1) {
      state.transferWidget = false;
      state.controller.nextPage(
          duration: const Duration(milliseconds: 1200), curve: Curves.easeInOut);
    } else {
      state.controller.nextPage(
          duration: const Duration(milliseconds: 1200), curve: Curves.easeInOut);
      emit(OnBoardingState());
    }
  }

  FutureOr<void> _NavigatorToLoginScreen(
      NavigatorToLoginScreen event, Emitter<OnBoardingState> emit) {
    Navigator.pushAndRemoveUntil(
        event.context,
        PageTransition(
            child: FadeInDown(
                duration: const Duration(milliseconds: 1400),
                delay: const Duration(milliseconds: 200),
                child: const LoginScreen()),
            duration: const Duration(milliseconds: 1500),
            type: PageTransitionType.bottomToTop),
        (route) => false);
  }
}
