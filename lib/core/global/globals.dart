import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

late final SharedPreferences sharedPreferences;
late List lastData;
// ignore: prefer_typing_uninitialized_variables
late var box;
late Database folderData;

Future init() async {
  await Hive.initFlutter();
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

  folderData = await openDatabase('folderData.file', version: 1,
      onCreate: (file, version) {
    return file.execute(
        'CREATE TABLE folder (id INTEGER PRIMARY KEY , author VARCHAR(100) , title VARCHAR(150) , description VARCHAR(500) ,url VARCHAR(500) ,urlToImage VARCHAR(800), publishedAt VARCHAR(500) ,content VARCHAR(500));');
  });
}
