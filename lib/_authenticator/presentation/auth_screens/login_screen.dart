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
                  height: media.height,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(40)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/back.jpg"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: media.height * .5,
                    right: media.width * .039,
                    child: Form(
                      key: state.formKeyLogin,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// TODO : AutoFill
                          CustomTextField(
                            prefixIcon: Icons.email,
                            textInputAction: TextInputAction.next,
                            labelText: "email",
                            hinText: "example@gmail.com",
                            fill: true,
                            fillColor: Theme.of(context).primaryColor,
                            valid: (p0) => state.errorEmail(state.emailController,
                                val: p0.toString(), ErrorSpace: "email"),
                            width: media.width * .9,
                            controller: bloc.state.emailController,
                            borderColor: Colors.grey,
                          ),
                          SizedBox(
                            height: media.height * .03,
                          ),
                          CustomTextField(
                            fill: true,
                            fillColor: Theme.of(context).primaryColor,
                            prefixIcon: Icons.lock,
                            suffixIcon: Icons.visibility_outlined,
                            onPressedSuffixIcon: () {
                              /// TODO : ---------
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
                          ),
                          SizedBox(height: media.height*.03,) ,
                          CustomButton(
                            height: media.height * .05,
                            width: media.width * .5,
                            onPressed: () async {
                              bloc.add(LoginEvent(
                                  email: bloc.state.emailController.text,
                                  password: bloc.state.passwordController.text));
                            },
                            text: "login",
                            // color: Colors.pink,
                          )
                        ],
                      ),
                    )),

                Positioned(
                    child: SafeArea(
                        child: SizedBox(
                  width: media.width,
                  height: media.height * .08,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: media.width * .05),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).primaryColor),
                          child: CustomText(" > News")),
                    ],
                  ),
                ))),
              ],
            ),
          );
        },
      ),
    );
  }
}
