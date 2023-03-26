// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:news_app_clean_architecture/core/global/globals.dart';
import 'intro_state.dart';

class IntroBloc extends Cubit<IntroState> {
  IntroBloc() : super(InitializeIntroState());

  static IntroBloc get(context) => BlocProvider.of(context);

  Future<void> changeLocalizationEvent() async {
    if (sharedPreferences.getString("Localization") == "en") {
      await sharedPreferences.setString("Localization", "ar");
    } else {
      await sharedPreferences.setString("Localization", "en");
    }
    emit(ChangeLocalization());
  }

  Future<Position> checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getLatAndLong() async {
    Position position = await checkPermission();

    position =  Position(
        longitude: position.longitude,
        latitude: position.latitude,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    await sharedPreferences.setString("address",
        '${place.locality} - ${place.subAdministrativeArea}, ${place.administrativeArea}');
    await sharedPreferences.setDouble("longitude", position.longitude);
    await sharedPreferences.setDouble("latitude", position.latitude);
  }

 
}