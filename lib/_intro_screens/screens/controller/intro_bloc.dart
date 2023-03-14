// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:news_app_clean_architecture/core/global/globals.dart';
import 'intro_state.dart';

part 'intro_event.dart';

class IntroScreensBloc extends Bloc<IntroScreensEvent, IntroScreensState> {
  IntroScreensBloc() : super(IntroScreensState()) {
    on<SwitchPageViewEvent>(_switchPageViewEvent);
    on<ActiveIconEvent>(_activeIconEvent);
    on<ChangeLocalizationEvent>(_changeLocalizationEvent);
    on<ChangeThemeModeEvent>(_changeThemeModeEvent);
    // on<GetLocationEvent>(_Get);
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

  // FutureOr<void> _NavigatorToLoginScreen(
  //     NavigatorToLoginScreen event, Emitter<IntroScreensState> emit) {
  //   Navigator.pushAndRemoveUntil(
  //       event.context,
  //       PageTransition(
  //           child: FadeInDown(
  //               duration: const Duration(milliseconds: 1400),
  //               delay: const Duration(milliseconds: 200),
  //               child: const RegisterScreen()),
  //           duration: const Duration(milliseconds: 1500),
  //           type: PageTransitionType.bottomToTop),
  //       (route) => false);
  // }

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

  Future<FutureOr<void>> _changeLocalizationEvent(
      ChangeLocalizationEvent event, Emitter<IntroScreensState> emit) async {
    if (sharedPreferences.getBool("isArabic") == false) {
      await sharedPreferences.setBool("isArabic", true);
      await sharedPreferences.setString("Localization", "ar");
    } else {
      await sharedPreferences.setBool("isArabic", false);
      await sharedPreferences.setString("Localization", "en");
    }
    emit(IntroScreensState());
  }

  Future<FutureOr<void>> _changeThemeModeEvent(
      ChangeThemeModeEvent event, Emitter<IntroScreensState> emit) async {
    if (sharedPreferences.getBool("isThemeModeDark") == true) {
      await sharedPreferences.setBool("isThemeModeDark", false);
    } else {
      await sharedPreferences.setBool("isThemeModeDark", true);
    }
    emit(IntroScreensState());
  }

  // Future<FutureOr<void>> _Get(
  //     GetLocationEvent event, Emitter<IntroScreensState> emit) async {
  //   Location a = Location();
  //   dynamic b = await a.getLocation();
  //   state.longitude = b.longitude;
  //   state.latitude = b.latitude;
  //   await sharedPreferences.setDouble("longitude", b.longitude);
  //   await sharedPreferences.setDouble("latitude", b.latitude);
  //   print("${state.latitude} / ${state.longitude}");
  // }
}
