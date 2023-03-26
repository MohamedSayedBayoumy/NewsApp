import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;

Future init() async {
  sharedPreferences = await SharedPreferences.getInstance();

  if (sharedPreferences.getString('Localization') == null) {
    sharedPreferences.setString("Localization", "en");
    // print(sharedPreferences.getString('Localization'));
  } else {}

  if (sharedPreferences.getBool('isThemeModeDark') == null) {
    sharedPreferences.setBool("isThemeModeDark", true);
  } else {}

  if (sharedPreferences.getBool('isLogin') == null) {
    sharedPreferences.setBool("isLogin", false);
  } else {}
}
