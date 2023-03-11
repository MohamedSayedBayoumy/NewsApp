import 'package:flutter/material.dart';

import '../../../global/globals.dart';
import '../../sizes_theme/app_sizes.dart';
import 'color_light_app.dart';

ThemeData appLightThem = ThemeData(
  primaryColor: Colors.white,
  backgroundColor: AppColorLight.backGroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(color: Colors.deepPurple),
          primary: AppColorLight.buttonColor)),
  textTheme: TextTheme(
      titleLarge: TextStyle(
          color: AppColorLight.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textLargeSize,
          fontFamily: sharedPreferences.getString("Localization") == "en"
              ? "titanOne"
              : "arabic"),
      displaySmall: TextStyle(
          color: AppColorLight.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textDefaultSize,
          letterSpacing: AppSizes.textSpaceLetter,
          fontFamily: sharedPreferences.getString("Localization") == "en"
              ? "inter"
              : "arabicLess"),
      titleMedium: TextStyle(
          color: AppColorLight.colorButtonText,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textDefaultSize,
          fontFamily: "gilroy"),
      displayLarge: TextStyle(
          color: AppColorLight.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textDefaultSize,
          letterSpacing: AppSizes.onBoardingLargeSpace,
          fontFamily: sharedPreferences.getString("Localization") == "en"
              ? "inter"
              : "arabicLess"),
      displayMedium: TextStyle(
          color: AppColorLight.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textDefaultSize,
          letterSpacing: AppSizes.textSpaceLetter,
          fontFamily: sharedPreferences.getString("Localization") == "en"
              ? "poppins"
              : "arabic")),
);
