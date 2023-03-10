// ignore_for_file: must_be_immutable

part of 'intro_bloc.dart';

class IntroScreensState extends Equatable {
  PageController controller = PageController();

  int turn = 0;
  dynamic turnHomeScreen = 0;
  bool transferWidget = true;

  PageController controllerHomeScreen = PageController();

  List<OnBoardingModel> modelOnBoarding = [
    OnBoardingModel(
        title: "News World",
        image: "assets/animation_image/on_borading/onBorading1.json",
        subTitle:
            "Now you can check news with out our posts like update image profile , cover profile , status etc , Now only news "),
    OnBoardingModel(
        title: "Sport News",
        image1: "assets/images/on_boarding/basketball.png",
        subTitle: "Basketball news and all team you can follow our with us "),
    OnBoardingModel(
        title: "Weather News",
        image1: "assets/images/on_boarding/cloudy.png",
        subTitle:
            "Now you can follow news weather and now weather other country that by search by name country"),
  ];

  IntroScreensState({this.turnHomeScreen});

  IntroScreensState copyWith({required int? turnHomeScreen}) =>
      IntroScreensState(turnHomeScreen: turnHomeScreen ?? this.turnHomeScreen);

  @override
  List<Object?> get props => [controller, turn, modelOnBoarding];
}

List<BottomNavigationModel> bottomNavigation = [
  BottomNavigationModel(image: "assets/icons/homepage.png", index: true),
  BottomNavigationModel(image: "assets/icons/cloud.png", index: false),
  BottomNavigationModel(image: "assets/icons/user.png", index: false),
];
