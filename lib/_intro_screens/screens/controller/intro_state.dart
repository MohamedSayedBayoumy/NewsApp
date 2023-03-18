// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';


import '../../domain/entitie/entite_model.dart';

abstract class IntroState {}

class InitializeIntroState extends IntroState{}
class ChangeLocalization extends IntroState{}


List<BottomNavigationModel> bottomNavigation = [
  BottomNavigationModel(image: "assets/icons/homepage.png", index: true),
  BottomNavigationModel(image: "assets/icons/cloud.png", index: false),
  BottomNavigationModel(image: "assets/icons/user.png", index: false),
];

