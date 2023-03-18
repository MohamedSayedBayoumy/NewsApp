// ignore_for_file: unnecessary_null_comparison, must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../_authenticator/presentation/auth_screens/register_screen.dart';
import '../../../core/widgets/custom_button/custom_button.dart';
import '../../../core/widgets/custom_do_animtion/custom_fade_animation.dart';
import '../../domain/entitie/entite_model.dart';
import '../component/custom_text_on Boarding/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();

  int turn = 0;

  bool transferWidget = false;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    List<OnBoardingModel> modelOnBoarding = [
      OnBoardingModel(
        title: AppLocalizations.of(context)!.onBoardingTitle1,
        image: "assets/animation_image/on_boarding/onBoarding1.json",
        subTitle: AppLocalizations.of(context)!.onBoarding1,
      ),
      OnBoardingModel(
          title: AppLocalizations.of(context)!.onBoardingTitle2,
          image1: "assets/images/on_boarding/basketball.png",
          subTitle: AppLocalizations.of(context)!.onBoarding2),
      OnBoardingModel(
          title: AppLocalizations.of(context)!.onBoardingTitle3,
          image1: "assets/images/on_boarding/cloudy.png",
          subTitle: AppLocalizations.of(context)!.onBoarding3),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: media.width * .05, vertical: media.width * .1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: media.width * .02),
              padding: EdgeInsets.symmetric(
                  horizontal: media.width * .03, vertical: media.height * .009),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.grey.shade200,
              ),
              child: SmoothPageIndicator(
                controller: controller,
                count: modelOnBoarding.length,
                effect: const ScrollingDotsEffect(
                    spacing: 8.0,
                    dotWidth: 20.0,
                    dotColor: Colors.black54,
                    activeDotColor: Colors.yellow),
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: modelOnBoarding.length,
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    turn = value ;
                  });
                  },
                itemBuilder: (context, index) {
                  return fadeElasticIn(
                      child: Container(
                    width: media.width,
                    height: media.height,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: media.width * .02),
                    padding: EdgeInsets.symmetric(
                        horizontal: media.width * .03,
                        vertical: media.height * .02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            height: media.height * .5,
                            child: modelOnBoarding[index].image1 == null
                                ? Lottie.asset(
                                    modelOnBoarding[index].image.toString(),
                                  )
                                : Image.asset(
                                    modelOnBoarding[index].image1.toString(),
                                    width: media.width * .4,
                                  )),
                        CustomTextOnBoarding(modelOnBoarding[index].title),
                        SizedBox(
                          height: media.height * .03,
                        ),
                        CustomText(modelOnBoarding[index].subTitle),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AnimatedCrossFade(
                                firstChild: IconButton(
                                    onPressed: () {
                                      if (turn == 1) {
                                        setState(() {
                                          transferWidget =! transferWidget;
                                        });
                                        controller.nextPage(
                                            duration: const Duration(milliseconds: 1200),
                                            curve: Curves.easeInOut);
                                      } else {
                                        controller.nextPage(
                                            duration: const Duration(milliseconds: 1200),
                                            curve: Curves.easeInOut);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.navigate_next_sharp,
                                      size: 40,
                                    )),
                                secondChild: CustomButton(
                                  onPressed: () => Navigator.pushAndRemoveUntil(
                                      context,
                                      PageTransition(
                                          child: FadeInDown(
                                              duration: const Duration(
                                                  milliseconds: 1400),
                                              delay: const Duration(
                                                  milliseconds: 200),
                                              child: const RegisterScreen()),
                                          duration: const Duration(
                                              milliseconds: 1500),
                                          type: PageTransitionType.bottomToTop),
                                      (route) => false),
                                  text: "Start",
                                  elevation: 50.0,
                                ),
                                crossFadeState: transferWidget == false
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(seconds: 15))
                          ],
                        ),
                      ],
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
