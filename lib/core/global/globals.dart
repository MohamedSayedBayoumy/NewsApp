import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;
// ignore: prefer_typing_uninitialized_variables
late var box;

Future init() async {
  await Hive.initFlutter();
  late final SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();

  if (sharedPreferences.getString('Localization') == null) {
    await sharedPreferences.setString("Localization", "en");
  } else {}

  if (sharedPreferences.getBool('isThemeModeDark') == null) {
    sharedPreferences.setBool("isThemeModeDark", true);
  } else {}

  if (sharedPreferences.getBool('isLogin') == null) {
    sharedPreferences.setBool("isLogin", false);
  } else {}

  if (sharedPreferences.getBool('permissionIsDeniedForever') == null) {
    sharedPreferences.setBool("permissionIsDeniedForever", true);
  } else {}
}
