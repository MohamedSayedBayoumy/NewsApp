// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;

  dynamic isBold;

  CustomText(this.text, {this.isBold = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        textAlign: TextAlign.center,
        style: isBold
            ? Theme.of(context).textTheme.displayMedium
            : Theme.of(context).textTheme.displaySmall);
  }
}
