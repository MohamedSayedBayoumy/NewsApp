import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/theme/theme_data/light_theme/color_light_app.dart';

import '../../../global/globals.dart';
import '../../sizes_theme/app_sizes.dart';
import 'color_dark_app.dart';

ThemeData appDarkThem = ThemeData(
  primaryColor: Colors.black87,
  scaffoldBackgroundColor: AppColorDark.backGroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: AppColorLight.buttonColor)),
  backgroundColor: AppColorLight.buttonColor,
  textTheme: TextTheme(
      titleLarge: TextStyle(
          color: AppColorDark.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textLargeSize,
          fontFamily: sharedPreferences.getString("Localization") == "en"
              ? "titanOne"
              : "arabic"),
      displaySmall: TextStyle(
          color: AppColorDark.textColor,
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
          color: AppColorDark.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textDefaultSize,
          letterSpacing: AppSizes.textSpaceLetter,
          fontFamily: sharedPreferences.getString("Localization") == "en"
              ? "poppins"
              : "arabicLess")),
);
