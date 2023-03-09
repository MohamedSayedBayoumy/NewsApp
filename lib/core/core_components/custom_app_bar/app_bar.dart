// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  dynamic title;
  dynamic color;
  dynamic colorText;
  dynamic elevation;
  dynamic child;
  dynamic customSize;

  dynamic toolbarHeight;
  dynamic heightFlexibleSpace;
  Widget? leading;
  dynamic centerTitle ;
  List<Widget>? widgets ;

  CustomAppBar(
      {Key? key,
        this.title,
        this.elevation,
        this.leading,
        this.child,
        this.color,
        this.customSize,
        this.toolbarHeight,
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
        centerTitle: centerTitle == null ? true : false  ,
        toolbarHeight: toolbarHeight ?? media.height*.1,
        backgroundColor: Colors.transparent,
        elevation: elevation ?? 15.0,
        leading: leading  ,
        actions: widgets ,
        flexibleSpace: Container(height: heightFlexibleSpace),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'gilroy',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white),
        ),
    );
  }
}
