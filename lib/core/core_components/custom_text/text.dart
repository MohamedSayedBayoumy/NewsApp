// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/theme/sizes_theme/app_sizes.dart';
import 'package:news_app_clean_architecture/core/theme/theme_data/light_theme/color_light_app.dart';

class CustomText extends StatelessWidget {
  String? text;

  dynamic isBold;

  CustomText(this.text, {this.isBold = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text!,
        maxFontSize: AppSizes.textMaxSize,
        minFontSize: AppSizes.textMinSize,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: isBold
            ? Theme.of(context).textTheme.displayMedium
            : Theme.of(context).textTheme.displaySmall);
  }
}

class CustomTextLarge extends StatelessWidget {
  String? text;

  dynamic isBold;

  CustomTextLarge(this.text, {this.isBold = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge);
  }
}

class CustomTextButton extends StatelessWidget {
  String? text;

  CustomTextButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text!,
      textAlign: TextAlign.center,
      style: TextStyle(color: AppColorLight.buttonColor ,fontSize: 18.0 ,fontFamily: "poppins"),
    );
  }
}
