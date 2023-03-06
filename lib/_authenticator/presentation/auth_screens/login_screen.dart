import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_clean_architecture/_authenticator/data/auth_model_data/auth_data_model.dart';
import 'package:news_app_clean_architecture/_authenticator/data/auth_remote_data_source/auth_remote_data.dart';
import 'package:news_app_clean_architecture/_authenticator/data/auth_repository_data/auth_data_repository.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_base_repository/auth_base_repository.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_base_use_case/auth_use_case.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_entites/auth_entits.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_button/custom_button.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_textfiled/text_filed.dart';
import 'package:news_app_clean_architecture/core/network/error/error.dart';

import '../../../core/core_components/custom_app_bar/app_bar.dart';
import '../../../core/core_components/custom_text/text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key, required this.authUseCase}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final AuthUseCase authUseCase;

   AuthModel? authModel  ;
   dynamic loll ;

  Future<void> lol() async {
    final x = await authUseCase(
        AuthParameters(emailController.text, passwordController.text));
    x.fold((l) {
      loll = l.message ;
      print(loll) ;
    }  , (r){
      print("data : $r") ;
      authModel   = r ;
      print(authModel!.message);
    }   );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.passthrough,
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
                    Colors.indigo.shade500,
                    Colors.indigo.shade800,
                    Colors.indigo.shade900,
                  ]),
            ),
          ),
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
          Positioned(
              top: media.height * .4,
              right: media.width * .039,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    prefixIcon: Icons.email,
                    textInputAction: TextInputAction.next,
                    labelText: "email",
                    hinText: "example@gmail.com",
                    valid: (p0) {
                      /// TODO : --------
                    },
                    width: media.width * .9,
                    controller: emailController,
                    borderColor: Colors.grey,
                  ),
                  SizedBox(
                    height: media.height * .03,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.visibility_outlined,
                    onPressedSuffixIcon: () {
                      /// TODO : ---------
                    },
                    textInputAction: TextInputAction.done,
                    labelText: "password",
                    hinText: "password",
                    valid: (p0) {
                      /// TODO : --------
                    },
                    width: media.width * .9,
                    controller: passwordController,
                    borderColor: Colors.grey,
                  ),
                ],
              )),
          Positioned(
              top: media.height * .6,
              right: media.width * .25,
              child: CustomButton(
                height: media.height * .05,
                width: media.width * .5,
                onPressed: () async {
                  await lol();
                },
                text: "login",
                color: Colors.pink,
              )),
          Positioned(
              top: media.height * .66,
              right: media.width * .29,
              child: Row(
                children: [
                  CustomText(
                    "Sing Up? ",
                    isBold: false,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.pink,
                            fontFamily: "poppins",
                            fontSize: 19),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
