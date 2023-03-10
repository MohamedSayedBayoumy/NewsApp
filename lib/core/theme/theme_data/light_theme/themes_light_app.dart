import 'package:flutter/material.dart';

import '../../sizes_theme/app_sizes.dart';
import 'color_light_app.dart';

ThemeData appLightThem = ThemeData(
  backgroundColor: AppColorLight.backGroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.deepPurple),primary: AppColorLight.buttonColor)),
  textTheme: TextTheme(

      titleMedium: TextStyle(
          color: AppColorLight.colorButtonText,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textDefaultSize,
          fontFamily: "gilroy"),
      titleLarge: TextStyle(
          color: AppColorLight.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textLargeSize,
          fontFamily: "titanOne"),
      displaySmall: TextStyle(
          color: AppColorLight.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textDefaultSize,
          letterSpacing: AppSizes.textSpaceLetter,
          fontFamily: "inter"),
      displayLarge: TextStyle(
          color: AppColorLight.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textDefaultSize,
          letterSpacing: AppSizes.onBoardingLargeSpace,
          fontFamily: "inter"),
      displayMedium: TextStyle(
          color: AppColorLight.textColor,
          overflow: TextOverflow.fade,
          fontSize: AppSizes.textDefaultSize,
          letterSpacing: AppSizes.textSpaceLetter,
          fontFamily: "poppins")),
);
