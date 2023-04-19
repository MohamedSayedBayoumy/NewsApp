import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;
// late List lastData;
// ignore: prefer_typing_uninitialized_variables
late var box;

Future init() async {
  await Hive.initFlutter();
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

 
}
