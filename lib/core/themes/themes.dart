import 'package:flutter/material.dart';

ThemeData appLightThem = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.yellow,
  textTheme: const TextTheme(
      displayMedium: TextStyle(
          color: Colors.yellowAccent, fontFamily: "inter", fontSize: 25.0),
      bodyLarge: TextStyle(
          color: Colors.black, fontFamily: "titanOne", fontSize: 40.0),
      bodySmall:
          TextStyle(color: Colors.black, fontFamily: "poppins", fontSize: 14.0),
      bodyMedium: TextStyle(
          color: Colors.black, fontFamily: "poppins", fontSize: 18.0)),
);

ThemeData appDarkThem = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.yellow,
  textTheme: const TextTheme(
      displayMedium: TextStyle(
          color: Colors.yellowAccent, fontFamily: "inter", fontSize: 25.0),
      bodyLarge: TextStyle(
          color: Colors.white, fontFamily: "titanOne", fontSize: 40.0),
      bodySmall:
          TextStyle(color: Colors.white, fontFamily: "poppins", fontSize: 14.0),
      bodyMedium: TextStyle(
          color: Colors.white, fontFamily: "poppins", fontSize: 18.0)),
);
