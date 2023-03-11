// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entitie/entite_model.dart';




class IntroScreensState extends Equatable {
  PageController controller = PageController();

  int turn = 0;
  dynamic turnHomeScreen = 0;
  bool transferWidget = true;


  PageController controllerHomeScreen = PageController();



  IntroScreensState({this.turnHomeScreen});

  IntroScreensState copyWith({required int? turnHomeScreen}) =>
      IntroScreensState(turnHomeScreen: turnHomeScreen ?? this.turnHomeScreen);

  @override
  List<Object?> get props => [controller, turn];
}

List<BottomNavigationModel> bottomNavigation = [
  BottomNavigationModel(image: "assets/icons/homepage.png", index: true),
  BottomNavigationModel(image: "assets/icons/cloud.png", index: false),
  BottomNavigationModel(image: "assets/icons/user.png", index: false),
];
