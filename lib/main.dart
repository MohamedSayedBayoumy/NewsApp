import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/_intro_screens/screens/controller/intro_cubit.dart';
import 'package:news_app_clean_architecture/_intro_screens/screens/controller/intro_state.dart';
import '_authenticator/presentation/auth_screens/phone_screen.dart';
import 'core/global/globals.dart';
import 'core/services/services_locator.dart';
import 'core/theme/theme_data/dark_theme/themes_dark_app.dart';
import 'core/theme/theme_data/light_theme/themes_light_app.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServicesLocator.service();
  await init();
  runApp(const MyApp());
}

//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   ServicesLocator.service();
//   await init();
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<IntroBloc>(),
      child: BlocBuilder<IntroBloc, IntroState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            locale: sharedPreferences.getString("Localization") == "en"
                ? const Locale("en")
                : const Locale("ar"),
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            theme: appLightThem,
            darkTheme: appDarkThem,
            themeMode: sharedPreferences.getBool('isThemeModeDark') == true
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: AddPhoneScreen(),
          );
        },
      ),
    );
  }
}
