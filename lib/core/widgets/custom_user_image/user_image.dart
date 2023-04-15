import 'package:flutter/material.dart';

import '../../global/globals.dart';
import '../custom_text/text.dart';

class UserImage extends StatelessWidget {
  final bool? isAppBar;
  const UserImage({required this.isAppBar, super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return CircleAvatar(
      backgroundColor: isAppBar == true ? Colors.amber : Colors.white,
      radius: media.height * .08,
      child: CircleAvatar(
        radius: isAppBar == true ? media.height * .015 : media.height * .07,
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
