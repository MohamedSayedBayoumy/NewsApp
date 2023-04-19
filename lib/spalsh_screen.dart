import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_do_animtion/custom_fade_animation.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';
import 'package:page_transition/page_transition.dart';

import 'core/global/globals.dart';
import 'presentation_screens/presentation/screens/home_screen/page_view_screen.dart';
import 'presentation_screens/presentation/screens/intro_screen/start_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 10),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const Condition(), type: PageTransitionType.rightToLeft),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/images/letter-n.png",
            height: media.height * .3,
          )),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: media.width * .13,
                  height: media.height * .03,
                  alignment: Alignment.center,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: media.width * .03,
                      fontFamily: 'poppins',
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        ScaleAnimatedText('News'),
                        ScaleAnimatedText('Weather'),
                      ],
                    ),
                  ),
                ),
                fadeUpToDown(
                    child: CustomText(
                  color: Colors.white,
                  text: "App",
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Condition extends StatelessWidget {
  const Condition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sharedPreferences.getBool('isLogin') == true) {
      return const PageViewScreen();
    } else {
      return const StartUpScreen();
    }
  }
}
