import 'package:flutter/material.dart';

import '../../global/globals.dart';
import '../custom_text/text.dart';

class UserImage extends StatelessWidget {
  final Color? backGroundColor;

  final double? backGroundRadius;
  const UserImage(
      {required this.backGroundRadius,
      required this.backGroundColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return CircleAvatar(
      backgroundColor:backGroundColor,
      radius: media.height * .08,
      child: CircleAvatar(
        radius: backGroundRadius ,
        backgroundColor: Colors.black,
        child: CustomText(
          text: sharedPreferences
              .getString("name")
              .toString()
              .split("")
              .first
              .toUpperCase(),
        ),
      ),
    );
  }
}
