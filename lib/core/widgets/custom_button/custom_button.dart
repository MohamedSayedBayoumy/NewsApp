// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

// ignore: camel_case_types
class customButton extends StatefulWidget {
  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final double? elevation;
  final double? width;
  final double? padding;
  final double? height;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final Size? media;
  final BuildContext? context;
  const customButton({
    Key? key,
    this.onPressed,
    this.text,
    this.child,
    this.elevation,
    this.width,
    this.padding,
    this.height,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.media,
    this.context,
  }) : super(key: key);

  @override
  State<customButton> createState() => _customButtonState();
}

// ignore: camel_case_types
class _customButtonState extends State<customButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.backgroundColor ?? Colors.amber,
              padding: EdgeInsets.symmetric(
                  horizontal: widget.padding ??
                      MediaQuery.of(context).size.width * .07),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: widget.child ??
              CustomText(
                text: widget.text!,
                color: widget.textColor ?? Colors.black,
                fontSize:
                    widget.fontSize ?? MediaQuery.of(context).size.width * .065,
              ),
        ));
  }
}
