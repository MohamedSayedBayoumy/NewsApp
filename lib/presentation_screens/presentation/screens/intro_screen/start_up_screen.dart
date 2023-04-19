// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../_authenticator/presentation/auth_screens/login_screen.dart';
import '../../../../core/global/globals.dart';
import '../../../../core/widgets/custom_app_bar/app_bar.dart';
import '../../../../core/widgets/custom_button/custom_button.dart';
import '../../../../core/widgets/custom_do_animtion/custom_fade_animation.dart';
import '../../../../core/widgets/custom_text/text.dart';
import 'package:app_settings/app_settings.dart';

import 'onboarding_screen.dart';

class StartUpScreen extends StatefulWidget {
  final bool? permission;
  const StartUpScreen({this.permission, Key? key}) : super(key: key);

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState() {
    super.initState();
    if (sharedPreferences.getBool("permissionIsDeniedForever") == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () {
                exit(0);
              },
              child: AlertDialog(
                backgroundColor: Colors.black,
                title: Text(
                  AppLocalizations.of(context)!.notice,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .06,
                      color: Colors.amber,
                      fontFamily:
                          sharedPreferences.getString("Localization") == "en"
                              ? "poppins"
                              : "arabic"),
                ),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/settings.png",
                        height: MediaQuery.of(context).size.height * .08,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        AppLocalizations.of(context)!.messageNotice,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .03,
                            color: Colors.white,
                            fontFamily:
                                sharedPreferences.getString("Localization") ==
                                        "en"
                                    ? "poppins"
                                    : "arabic"),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Center(
                    child: CustomButton(
                      backgroundColor: const Color.fromARGB(255, 13, 233, 21),
                      child: Text(
                        textAlign: TextAlign.center,
                        AppLocalizations.of(context)!.setting,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .03,
                            color: Colors.white,
                            fontFamily:
                                sharedPreferences.getString("Localization") ==
                                        "en"
                                    ? "poppins"
                                    : "arabic"),
                      ),
                      onPressed: () {
                        AppSettings.openAppSettings().then((value) {
                          exit(0);
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
    } else {
      print("Changed Permissions");
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: media.width,
            height: media.height,
          ),
          Positioned(
            height: media.height * .6,
            child: SizedBox(
              width: media.width,
              height: media.height * .15,
              child: ShaderMask(
                blendMode: BlendMode.dstIn,
                shaderCallback: (bounds) => const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [0, 0.3, 0.5, 1],
                ).createShader(
                  Rect.fromLTRB(
                      media.height * .03, 0, bounds.width * .09, bounds.height),
                ),
                child:
                    Image.asset("assets/images/phone.jpg", fit: BoxFit.cover),
              ),
            ),
          ),
          CustomAppBar(
              colorBackground: Colors.transparent,
              elevation: 0.0,
              title: "",
              widgets: [
                IconButton(
                    onPressed: () {
                      // BlocProvider.of<IntroBloc>(context)
                      //     .checkPermission(context: context);
                    },
                    icon: const Icon(
                      Icons.language,
                      color: Color.fromARGB(255, 255, 230, 0),
                    ))
              ]),
          Positioned(
            bottom: media.height * .01,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: media.width * .05),
              child: SizedBox(
                width: media.width * .9,
                height: media.height * .5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: media.height * .05,
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomText(
                        text: AppLocalizations.of(context)!.startUp1,
                        fontSize: media.width * .071,
                      ),
                    ),
                    SizedBox(
                      height: media.height * .01,
                    ),
                    CustomText(
                      text: AppLocalizations.of(context)!.startUp2,
                      fontSize: media.width * .035,
                    ),
                    SizedBox(
                      height: media.height * .05,
                    ),
                    CustomButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            PageTransition(
                                child: fadeDownTOUp(
                                    child: const OnBoardingScreen()),
                                type: PageTransitionType.rightToLeftWithFade),
                          );
                        },
                        text: AppLocalizations.of(context)!.startUp3,
                        width: media.width,
                        height: media.height * .06),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            fontSize: media.width * .035,
                            text: AppLocalizations.of(context)!.startUp4,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    child: const LoginScreen(),
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    type: PageTransitionType.bottomToTop),
                              );
                            },
                            child: CustomText(
                              fontSize: media.width * .035,
                              text: AppLocalizations.of(context)!.startUp5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
