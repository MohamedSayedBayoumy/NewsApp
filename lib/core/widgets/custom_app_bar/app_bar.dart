// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  Color? textColor;
  Color? colorBackground;
  Color? colorText;
  double? elevation;
  Widget? child;
  double? customSize;

  double? toolbarHeight;
  double? heightFlexibleSpace;
  Widget? leading;
  bool? centerTitle;

  List<Widget>? widgets;

  CustomAppBar(
      {Key? key,
      this.title,
      this.elevation,
      this.leading,
      this.child,
      this.textColor,
      this.customSize,
      this.toolbarHeight,
      this.colorBackground,
      this.centerTitle,
      this.heightFlexibleSpace,
      this.widgets,
      this.colorText})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(customSize ?? 80.0);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return AppBar(
        centerTitle: centerTitle == null ? true : false,
        toolbarHeight: toolbarHeight ?? media.height * .1,
        backgroundColor: colorBackground ?? Colors.transparent,
        elevation: elevation ?? 15.0,
        leading: leading,
        actions: widgets,
        flexibleSpace: Container(height: heightFlexibleSpace),
        title: CustomText(
          text: title!,
          color: Colors.black,
        ));
  }
}
