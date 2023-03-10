// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;

  dynamic text;

  dynamic child;

  dynamic elevation;


  dynamic width;
  dynamic padding;

  dynamic height;

  CustomButton({
    Key? key,
    required this.onPressed,
    this.child,
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
        child: child ??
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
        style: ElevatedButton.styleFrom(
            padding:
                EdgeInsets.symmetric(horizontal: padding ?? media.width * .07),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
