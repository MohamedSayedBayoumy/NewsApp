// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../_authenticator/presentation/auth_screens/login_screen.dart';
import '../../../../core/functions/alert_diloge.dart';
import '../../../../core/global/globals.dart';
import '../../../../core/widgets/custom_app_bar/app_bar.dart';
import '../../../../core/widgets/custom_button/custom_button.dart';
import '../../../../core/widgets/custom_text/text.dart';
import '../../controller/intro_cubit.dart';
import 'onboarding_screen.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState() {
    super.initState();
    if (sharedPreferences.getBool("permissionIsDeniedForever") == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        alertDialogMessage(context);
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
                      BlocProvider.of<IntroBloc>(context)
                          .changeLocalizationEvent();
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
                    customButton(
                        context: context,
                        onPressed: () async {
                          Navigator.of(context).push(createRoute());
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

  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OnBoardingScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(
          0.0,
          1.0,
        );
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
