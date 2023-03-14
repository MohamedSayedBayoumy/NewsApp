import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;

Future init() async {
  sharedPreferences = await SharedPreferences.getInstance();

  if (sharedPreferences.getString('Localization') == null) {
    sharedPreferences.setString("Localization", "en");
    sharedPreferences.setBool('isArabic', false);
    print(sharedPreferences.getString('Localization'));
  } else {}

  if (sharedPreferences.getBool('isThemeModeDark') == null) {
    sharedPreferences.setBool("isThemeModeDark", true);
  } else {}

  Location a = Location();
  dynamic b = await a.getLocation();
  await sharedPreferences.setDouble("longitude", b.longitude);
  await sharedPreferences.setDouble("latitude", b.latitude);
  print(
      "latitude : ${sharedPreferences.getDouble('latitude')} / longitude : ${sharedPreferences.getDouble('longitude')}");
}
