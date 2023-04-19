// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../global/globals.dart';

class CustomText extends StatelessWidget {
  String? text;
  TextStyle? style;
  TextAlign? textAlign;
  TextDirection? textDirection;
  Color? color;
  String? fontStyle;
  double? fontSize;
  final bool needDefaultStyle;

  CustomText(
      {this.textDirection,
      this.style,
      this.needDefaultStyle = false,
      this.text,
      this.textAlign,
      this.color,
      this.fontSize,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      textDirection: textDirection,
      text!,
      maxFontSize: 30,
      minFontSize: 12,
      maxLines: 3,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
          fontSize: fontSize ??
              (sharedPreferences.getString("Localization").toString() == "en"
                  ? fontSize
                  : MediaQuery.of(context).size.width * .05),
          color: color ?? Colors.white,
          fontFamily: needDefaultStyle == true
              ? "poppins"
              : sharedPreferences.getString("Localization") == "en"
                  ? "poppins"
                  : "arabic"),
    );
  }
}
