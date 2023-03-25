import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_screens/login_screen.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_button/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/widgets/custom_do_animtion/custom_fade_animation.dart';
import '../../../../core/widgets/custom_text/text.dart';
import 'onboarding_screen.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({Key? key}) : super(key: key);

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
              child: Image.asset("assets/images/phone.jpg", fit: BoxFit.cover),
            ),
          ),
        ),
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
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: media.height * .04,
                  ),
                  CustomText(
                    text: AppLocalizations.of(context)!.startUp2,
                  ),
                  SizedBox(
                    height: media.height * .05,
                  ),
                  CustomButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                                child: fadeDownTOUp(
                                    child: const OnBoardingScreen()),
                                type: PageTransitionType.rightToLeftWithFade),
                            (route) => false);
                      },
                      text: AppLocalizations.of(context)!.startUp3,
                      width: media.width,
                      height: media.height * .06),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: AppLocalizations.of(context)!.startUp4,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  child: fadeDownTOUp(child: LoginScreen()),
                                  type: PageTransitionType.bottomToTop),
                            );
                          },
                          child: CustomText(
                            text: AppLocalizations.of(context)!.startUp5,
                            style: Theme.of(context).textTheme.bodySmall,
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
    ));
  }
}
