import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/_weather_news/presentation/weather_controller/bloc/weather_event.dart';
import 'package:news_app_clean_architecture/_weather_news/presentation/weather_controller/bloc/weather_state.dart';
import 'package:news_app_clean_architecture/core/utils/enum.dart';

import '../../../../core/functions/snack_bar.dart';
import '../../../domain/weather_base_use_case/weather_base_usecase.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.baseWeatherUseCase) : super(WeatherState()) {
    on<FetchWeatherDataEvent>(_fetchWeatherDataEvent);
    on<FetchWeatherDataByCountryNameEvent>(_fetchWeatherDataByCountryNameEvent);
  }

  final BaseWeatherUseCase baseWeatherUseCase;

  Future<FutureOr<void>> _fetchWeatherDataEvent(
      FetchWeatherDataEvent event, Emitter<WeatherState> emit) async {
    state.weatherModel = await baseWeatherUseCase.fetchWeatherByLanAndLat();

    DefaultAssetBundle.of(event.context)
        .loadString("assets/map.json")
        .then((value) {
      state.themeMode = value;
    });

    emit(state.copyWith(
      statusRequest: Request.loaded,
      weatherModel: state.weatherModel,
    ));
  }

  Future<FutureOr<void>> _fetchWeatherDataByCountryNameEvent(
      FetchWeatherDataByCountryNameEvent event,
      Emitter<WeatherState> emit) async {
    try {
      state.weatherModel = await baseWeatherUseCase.fetchWeatherByCountryName(
          country: event.country);
      emit(state.copyWith(
        statusRequest: Request.loaded,
        weatherModel: state.weatherModel,
      ));
    } catch (e) {
      if (e.toString() ==
          "NoSuchMethodError: The method 'map' was called on null.") {
        ScaffoldMessenger.of(event.context)
            .showSnackBar(snackBar("يرجى التحقق من الاسم الذي أدخلته ", context: event.context));
      }
    }
  }
}
