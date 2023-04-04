// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class OnBoardingModel extends Equatable {
  dynamic image;
  dynamic image1;

  String? title;

  String? subTitle;

  OnBoardingModel({
    this.image,
    required this.title,
    required this.subTitle,
    this.image1,
  });

  @override
  List<Object> get props => [image, title!, subTitle!];
}

