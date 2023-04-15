// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enum.dart';
import '../../../domain/weather_entites/weather_model.dart';

class WeatherState extends Equatable {
  WeatherModel? weatherModel;

  final Request statusRequest;

  String? message;

  

  TextEditingController addressController = TextEditingController();
  TextEditingController? searchController = TextEditingController();

  WeatherState({
    this.weatherModel,
    this.statusRequest = Request.noAction,
    this.message,
    this.searchController,
  });

  WeatherState copyWith(
          {WeatherModel? weatherModel,
          List<Weather?>? weatherList,
          Request? statusRequest,
          String? message,
          TextEditingController? searchController}) =>
      WeatherState(
        message: message ?? this.message,
        weatherModel: weatherModel ?? this.weatherModel,
        statusRequest: statusRequest ?? this.statusRequest,
        searchController: searchController ?? this.searchController,
      );

  @override
  List<Object> get props => [statusRequest];
}
