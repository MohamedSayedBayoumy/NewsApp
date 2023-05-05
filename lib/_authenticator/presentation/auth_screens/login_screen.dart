import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_button/custom_button.dart';
import '../../../core/widgets/custom_text/text.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/widgets/custom_textfiled/text_filed.dart';
import '../auth_controller/auth_bloc.dart';
import '../auth_controller/auth_event.dart';
import '../auth_controller/auth_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          return SafeArea(
            child: Scaffold(
              body: ListView(
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
                                SizedBox(
                                  height: media.height * .05,
                                ),
                                customButton(
                                  context: context , 
                                    onPressed: () {
                                      bloc.add(
                                          LoginByGmailEvent(context: context));
                                    },
                                    elevation: 20.0,
                                    width: media.width,
                                    height: media.height * .08,
                                    backgroundColor: Colors.white,
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
                                              child: CustomText(
                                                fontSize: media.width * .043,
                                                color: Colors.black,
                                                text:
                                                    AppLocalizations.of(context)!
                                                        .signinWithGoogle,
                                              ),
                                            )),
                                      ],
                                    )),
                                SizedBox(
                                  height: media.height * .05,
                                ),
                                customButton(
                                    onPressed: () {
                                      bloc.add(LoginByFaceBookEvent(context: context));
                                    },
                                    elevation: 15.0,
                                    width: media.width,
                                    height: media.height * .08,
                                    backgroundColor:
                                        const Color.fromRGBO(30, 75, 150, 1),
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
                                              child: CustomText(
                                                fontSize: media.width * .043,
                                                text:
                                                    AppLocalizations.of(context)!
                                                        .signinWithFacebook,
                                              ),
                                            )),
                                      ],
                                    )),
                                SizedBox(
                                  height: media.height * .05,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      width: media.width * .03,
                                      color: Colors.yellowAccent,
                                      height: media.height * .001,
                                    )),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: media.width * .05),
                                      child: CustomText(
                                        text: AppLocalizations.of(context)!.or,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      width: media.width * .03,
                                      color: Colors.yellowAccent,
                                      height: media.height * .001,
                                    )),
                                  ],
                                ),
                                SizedBox(
                                  height: media.height * .05,
                                ),
                                CustomTextField(
                                  prefixIcon: Icons.email,
                                  textInputAction: TextInputAction.next,
                                  labelText: AppLocalizations.of(context)!.email,
                                  hinText: "example@example.com",
                                  valid: (p0) => state.errorEmail(
                                      state.emailController,
                                      val: p0.toString(),
                                      ErrorSpace:
                                          AppLocalizations.of(context)!.email),
                                  width: media.width * .9,
                                  controller: bloc.state.emailController,
                                  borderColor: Colors.grey,
                                ),
                                SizedBox(
                                  height: media.height * .04,
                                ),
                                CustomTextField(
                                  obscureText: state.showPassword,
                                  labelText:
                                      AppLocalizations.of(context)!.password,
                                  hinText: AppLocalizations.of(context)!.password,
                                  prefixIcon: Icons.lock,
                                  suffixIcon: Icons.visibility_outlined,
                                  textInputAction: TextInputAction.done,
                                  onPressedSuffixIcon: () {
                                    bloc.add(ChangeIconEvent());
                                  },
                                  valid: (p0) => state.errorPassword(
                                      state.passwordController,
                                      val: p0.toString(),
                                      ErrorSpace:
                                          AppLocalizations.of(context)!.password),
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
                                        child: CustomText(
                                            fontSize: media.width * .035,
                                            text: AppLocalizations.of(context)!
                                                .forgotpassword))
                                  ],
                                ),
                                SizedBox(
                                  height: media.height * .03,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customButton(
                                      height: media.height * .05,
                                      width: media.width * .55,
                                      onPressed: () async {
                                        bloc.add(LoginByEmailAndPasswordEvent(
                                            context: context,
                                            email:
                                                bloc.state.emailController.text,
                                            password: bloc
                                                .state.passwordController.text));
                                      },
                                      text: AppLocalizations.of(context)!.login,
                                      fontSize: media.width * .05,
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
