// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextOnBoarding extends StatelessWidget {
  String? text;

  CustomTextOnBoarding(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge);
  }
}
