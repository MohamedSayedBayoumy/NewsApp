// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enum.dart';
import '../../../domain/weather_entites/weather_model.dart';

class WeatherState extends Equatable {
  WeatherModel? weatherModel;

  final Request statusRequest;

  String? message;

  String? themeMode;

  TextEditingController addressController = TextEditingController();

  WeatherState(
      {this.weatherModel,
        this.statusRequest = Request.loading,
        this.message,
      });

  WeatherState copyWith({
    WeatherModel? weatherModel,
    List<Weather?>? weatherList,
    Request? statusRequest,
    String? message,
  }) =>
      WeatherState(
        message: message ?? this.message,
        weatherModel: weatherModel ?? this.weatherModel,
        statusRequest: statusRequest ?? this.statusRequest,
      );

  @override
  List<Object> get props => [weatherModel!, statusRequest];
}
