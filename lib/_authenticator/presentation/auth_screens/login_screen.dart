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

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<AuthBloc>(context);
          return Scaffold(
            body: Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  width: media.width,
                  height: media.height * .9,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(bottomLeft: Radius.circular(40)),
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
                        /// TODO : AutoFill
                        CustomTextField(
                          prefixIcon: Icons.email,
                          textInputAction: TextInputAction.next,
                          labelText: "email",
                          hinText: "example@gmail.com",
                          valid: (p0) {
                            /// TODO : --------
                          },
                          width: media.width * .9,
                          controller: bloc.state.emailController ,
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
                          controller: bloc.state.passwordController  ,
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
                        bloc.add(LoginEvent(
                            email: bloc.state.emailController .text,
                            password: bloc.state.passwordController .text));
                      },
                      text: "login",
                      // color: Colors.pink,
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
        },
      ),
    );
  }
}
