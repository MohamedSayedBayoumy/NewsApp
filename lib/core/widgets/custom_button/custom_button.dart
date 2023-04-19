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

  double? fontSize;

  Color? backgroundColor;
  Color? textColor;


  CustomButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.fontSize,
    this.backgroundColor,
    this.elevation,
    this.text,
    this.textColor,
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
              backgroundColor: backgroundColor ?? Colors.amber,
              padding: EdgeInsets.symmetric(
                  horizontal: padding ?? media.width * .07),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: child ??
              CustomText(
                text: text!,
                color: textColor ?? Colors.black,
                
                fontSize:fontSize??  media.width * .065,
              ),
        ));
  }
}
