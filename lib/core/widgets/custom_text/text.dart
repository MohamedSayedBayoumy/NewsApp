// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  TextStyle? style;

  CustomText({this.style, this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text!,
      maxFontSize: 30,
      minFontSize: 12,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
