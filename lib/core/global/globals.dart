import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;




Future init() async {
  sharedPreferences = await SharedPreferences.getInstance();
  print("hi") ;
}
