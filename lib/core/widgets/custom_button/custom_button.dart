// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;

  String? text;

  Widget? child;

  double? elevation;

  double? width;
  double? padding;

  double? height;

  Color? backgroundColor;

  CustomButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.backgroundColor,
    this.elevation,
    this.text,
    this.padding,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.yellowAccent,
            padding:
                EdgeInsets.symmetric(horizontal: padding ?? media.width * .07),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: child ??
            CustomText(
              text: text!,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "inter",
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
      ),
    );
  }
}
