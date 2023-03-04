// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class GeneralButton extends StatelessWidget {
  void Function()? onPressed;

  dynamic child;

  dynamic elevation;

  dynamic color;

  dynamic width;
  dynamic? padding;

  dynamic height;

  GeneralButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.elevation,
    this.color,
    this.padding,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size ;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: padding??media.width*.07),
            primary: color ,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp))),

      ),
    );
  }
}
