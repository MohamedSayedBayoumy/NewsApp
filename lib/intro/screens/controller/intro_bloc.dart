// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../_authenticator/presentation/auth_screens/login_screen.dart';
import '../../domain/entitie/entite_model.dart';

part 'intro_event.dart';

part 'intro_state.dart';

class IntroScreensBloc extends Bloc<IntroScreensEvent, IntroScreensState> {
  IntroScreensBloc() : super(IntroScreensState()) {
    on<SwitchPageViewEvent>(_switchPageViewEvent);
    on<NavigatorToLoginScreen>(_NavigatorToLoginScreen);
    on<ActiveIconEvent>(_activeIconEvent);
  }

  Future<FutureOr<void>> _switchPageViewEvent(
      SwitchPageViewEvent event, Emitter<IntroScreensState> emit) async {
    if (state.turn == 1) {
      state.transferWidget = false;
      state.controller.nextPage(
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeInOut);
    } else {
      state.controller.nextPage(
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeInOut);
      emit(IntroScreensState());
    }
  }

  FutureOr<void> _NavigatorToLoginScreen(
      NavigatorToLoginScreen event, Emitter<IntroScreensState> emit) {
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

  FutureOr<void> _activeIconEvent(
      ActiveIconEvent event, Emitter<IntroScreensState> emit) {
    state.turnHomeScreen = event.index!;
    for (int buttonIndex = 0;
        buttonIndex < bottomNavigation.length;
        buttonIndex++) {
      if (buttonIndex == event.index) {
        bottomNavigation[buttonIndex].index = true;
        if (state.controllerHomeScreen.hasClients) {
          state.controllerHomeScreen.jumpToPage(state.turnHomeScreen);
        }
        emit(state.copyWith(turnHomeScreen: state.turnHomeScreen));
      } else {
        bottomNavigation[buttonIndex].index = false;
        if (state.controllerHomeScreen.hasClients) {
          state.controllerHomeScreen.jumpToPage(state.turnHomeScreen);
        }
        emit(state.copyWith(turnHomeScreen: state.turnHomeScreen));
      }
    }
  }
}
