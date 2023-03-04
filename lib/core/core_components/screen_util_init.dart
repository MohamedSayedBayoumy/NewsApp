// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_clean_architecture/core/theme/theme_data/dark_theme/themes_dark_app.dart';
import 'package:news_app_clean_architecture/core/theme/theme_data/light_theme/color_light_app.dart';

import '../../home_screen_categories.dart';
import '../../on_boarding/screens/presentation/onboarding_screen.dart';
import '../theme/theme_data/light_theme/themes_light_app.dart';

class MaterialAppWithScreenUtil extends StatelessWidget {

    const MaterialAppWithScreenUtil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: appLightThem,
          darkTheme: appDarkThem,
          themeMode: ThemeMode.light ,
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child:   const OnBoardingScreen(),
    );
  }
}
