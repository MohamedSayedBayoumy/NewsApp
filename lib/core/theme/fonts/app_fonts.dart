import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/theme/sizes_theme/app_sizes.dart';

import '../theme_data/dark_theme/color_dark_app.dart';
import '../theme_data/light_theme/color_light_app.dart';

TextTheme fontTextLight = TextTheme(

  titleMedium: TextStyle(
      color: AppColorLight.colorButtonText,
      overflow: TextOverflow.fade,
      fontSize: AppSizes.textDefaultSize,
      fontFamily: "gilroy") ,

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
        fontFamily: "poppins"));




/// TODO : DARK THEM  : -


TextTheme fontTextDark = TextTheme(
    displaySmall: TextStyle(
        color: AppColorDark.textColor,
        overflow: TextOverflow.fade,
        fontSize: AppSizes.textDefaultSize,
        letterSpacing: AppSizes.textSpaceLetter,
        fontFamily: "inter"),

    titleMedium: TextStyle(
        color: AppColorLight.colorButtonText,
        overflow: TextOverflow.fade,
        fontSize: AppSizes.textDefaultSize,
        fontFamily: "gilroy") ,


    displayLarge: TextStyle(
        color: AppColorLight.textColor,
        overflow: TextOverflow.fade,
        fontSize: AppSizes.textDefaultSize,
        letterSpacing: AppSizes.onBoardingLargeSpace,
        fontFamily: "inter"),


    displayMedium: TextStyle(
        color: AppColorDark.textColor,
        overflow: TextOverflow.fade,
        fontSize: AppSizes.textDefaultSize,
        letterSpacing: AppSizes.textSpaceLetter,
        fontFamily: "poppins"));
