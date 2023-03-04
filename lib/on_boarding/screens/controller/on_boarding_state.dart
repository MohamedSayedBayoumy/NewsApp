// ignore_for_file: must_be_immutable

part of 'on_boarding_bloc.dart';

class OnBoardingState extends Equatable {
  PageController controller = PageController();

  int turn = 0;
  bool transferWidget = true;

  List<OnBoardingModel> modelOnBoarding = [
    OnBoardingModel(
        title: "News World",
        image:  "assets/animation_image/on_borading/onBorading1.json",
        subTitle: "Now you can check news with out our posts like update image profile , cover profile , status etc , Now only news "),
    OnBoardingModel(
        title: "Sport News",
        image1: "assets/images/on_boarding/basketball.png",
        subTitle: "Basketball news and all team you can follow our with us "),

    OnBoardingModel(
        title: "Weather News",
        image1: "assets/images/on_boarding/cloudy.png",
        subTitle: "Now you can follow news weather and now weather other country that by search by name country"),
  ];

  @override
  List<Object?> get props => [controller, turn];
}
