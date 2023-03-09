import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/global/globals.dart';
import 'core/services/services_locator.dart';
import 'core/theme/theme_data/dark_theme/themes_dark_app.dart';
import 'core/theme/theme_data/light_theme/themes_light_app.dart';
import 'on_boarding/screens/presentation/onboarding_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized() ;
//   ServicesLocator.service() ;
//   init() ;
//   runApp(const MyApp());
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.service();
  init();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) =>
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate ,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: appLightThem ,
      darkTheme: appDarkThem,
      themeMode: ThemeMode.light ,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}
