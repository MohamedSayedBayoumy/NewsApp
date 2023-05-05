// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

 

customButton({
  final void Function()? onPressed,
  final String? text,
  final Widget? child,
  final double? elevation,
  final double? width,
  final double? padding,
  final double? height,
  final double? fontSize,
  final Color? backgroundColor,
  final Color? textColor,
  final Size? media,
  final BuildContext? context,
}) =>
    SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.amber,
              padding: EdgeInsets.symmetric(
                  horizontal:
                      padding ?? MediaQuery.of(context!).size.width * .07),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: child ??
              CustomText(
                text: text!,
                color: textColor ?? Colors.black,
                fontSize: fontSize ?? MediaQuery.of(context!).size.width * .065,
              ),
        ));
 
