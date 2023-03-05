import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core_components/custom_app_bar/app_bar.dart';
import '../../../core/core_components/custom_text/text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: media.width,
            height: media.height * .9,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(40.sp)),
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    Colors.indigo.shade600,
                    Colors.indigo.shade700,
                    Colors.indigo.shade800,
                    Colors.indigo.shade900,
                  ]),
            ),
          ),
          SizedBox(
            width: 15,
          ) ,
          CustomAppBar(
            title: "Login",
            centerTitle: true,
            elevation: 0.0,
            widgets: [
              TextButton(
                  onPressed: () {},
                  child: CustomText(
                    "Skip",
                    isBold: false,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
