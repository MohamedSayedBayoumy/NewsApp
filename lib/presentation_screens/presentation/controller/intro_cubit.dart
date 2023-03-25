// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/global/globals.dart';
import 'intro_state.dart';

class IntroBloc extends Cubit<IntroState> {
  IntroBloc() : super(InitializeIntroState());

  static IntroBloc get(context) => BlocProvider.of(context);

  Future<void> changeLocalizationEvent() async {
    if (sharedPreferences.getString("Localization") == "en") {
      await sharedPreferences.setString("Localization", "ar");

    } else {

      await sharedPreferences.setString("Localization", "en");

    }
    emit(ChangeLocalization());
  }
}
