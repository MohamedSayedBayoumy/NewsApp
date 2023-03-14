import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_event.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_state.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_button/custom_button.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_textfiled/text_filed.dart';

import '../../../core/core_components/custom_app_bar/app_bar.dart';
import '../../../core/core_components/custom_text/text.dart';
import '../../../core/services/services_locator.dart';
import '../auth_controller/auth_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_bloc.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_state.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_text/text.dart';

import '../../../core/core_components/custom_button/custom_button.dart';
import '../../../core/core_components/custom_textfiled/text_filed.dart';
import '../../../core/services/services_locator.dart';
import '../auth_controller/auth_event.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GoogleSignIn x = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<AuthBloc>(context);
          return Scaffold(
            body: Container(
              width: media.width,
              height: media.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/back.jpg"),
                      fit: BoxFit.cover)),
              child: ListView(
                padding: EdgeInsets.only(top: media.height * .15),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: media.height * .03),
                    child: SizedBox(
                        width: media.width,
                        child: Form(
                          key: state.formKeyLogin,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// TODO : AutoFill
                              SizedBox(height: media.height*.05,) ,
                              CustomButton(
                                  onPressed: () {
                                    final GoogleSignIn x = GoogleSignIn();

                                    x.signIn().then((value) async {
                                      String d = value!.email;
                                      String? y = value.displayName;
                                      String? n = value.photoUrl;
                                      String? o = value.id;
                                      /// TODO : here we will check not register " => signInWithEmailAndPassword "

                                      print(o);
                                      print(n);
                                      print(y);
                                      print(d);
                                    });
                                  },
                                  elevation: 15.0,
                                  width: media.width,
                                  height: media.height * .07,
                                  primary: Colors.white,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Image.asset(
                                              "assets/icons/google.png")),
                                      Expanded(
                                          flex: 5,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "sign in with Google",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 15.0,
                                                  fontFamily: "poppins"),
                                            ),
                                          )),
                                    ],
                                  )),
                              SizedBox(height: media.height*.05,) ,
                              CustomButton(
                                  onPressed: () {
                                    bloc.add(LoginByFaceBookEvent());
                                  },
                                  elevation: 15.0,
                                  width: media.width,
                                  height: media.height * .07,
                                  primary: const Color.fromRGBO(30, 75, 150, 1),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Image.asset(
                                              "assets/icons/facebook.png")),
                                      Expanded(
                                          flex: 5,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "sign in with Facebook",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  fontFamily: "poppins"),
                                            ),
                                          )),
                                    ],
                                  )),
                              SizedBox(height: media.height*.05,) ,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                      child: Container(
                                        width: media.width * .03,
                                        color: Colors.black87,
                                        height: media.height * .001,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: media.width * .05),
                                    child: CustomText(
                                      "or",
                                      isBold: false,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                        width: media.width * .03,
                                        color: Colors.white,
                                        height: media.height * .001,
                                      )),
                                ],
                              ),
                              SizedBox(height: media.height*.05,) ,
                              CustomTextField(
                                prefixIcon: Icons.email,
                                textInputAction: TextInputAction.next,
                                labelText: "email",
                                hinText: "example@gmail.com",
                                fill: true,
                                fillColor: Theme.of(context).primaryColor,
                                valid: (p0) => state.errorEmail(
                                    state.emailController,
                                    val: p0.toString(),
                                    ErrorSpace: "email"),
                                width: media.width * .9,
                                controller: bloc.state.emailController,
                                borderColor: Colors.grey,
                              ),
                              SizedBox(
                                height: media.height * .03,
                              ),
                              CustomTextField(
                                obscureText: state.showPassword,
                                fill: true,
                                fillColor: Theme.of(context).primaryColor,
                                prefixIcon: Icons.lock,
                                suffixIcon: Icons.visibility_outlined,
                                onPressedSuffixIcon: () {
                                  bloc.add(ChangeIconEvent());
                                },
                                textInputAction: TextInputAction.done,
                                labelText: "password",
                                hinText: "password",
                                valid: (p0) => state.errorPassword(
                                    state.passwordController,
                                    val: p0.toString(),
                                    ErrorSpace: "password"),
                                width: media.width * .9,
                                controller: bloc.state.passwordController,
                                borderColor: Colors.grey,
                                maxLength: 1,
                                minLength: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        /// TODO : Update Password
                                      },
                                      child: CustomText("Forget password ?"))
                                ],
                              ),
                              SizedBox(
                                height: media.height * .03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    height: media.height * .05,
                                    width: media.width * .5,
                                    onPressed: () async {
                                      bloc.add(LoginByEmailAndPasswordEvent(
                                          email:
                                              bloc.state.emailController.text,
                                          password: bloc
                                              .state.passwordController.text));
                                    },
                                    text: "login",
                                    // color: Colors.pink,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
