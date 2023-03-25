
import 'package:news_app_clean_architecture/_weather_news/data/weather_model_data/weather_data.dart';

import '../../domain/weather_entites/weather_model.dart';

class WeatherModelData extends WeatherModel {
  WeatherModelData({
    required super.codeCountry,

    required super.latitude,
    required super.longitude,
    required super.weather,
    required super.message,
    required super.speedWind
  });

  factory WeatherModelData.fromJson(Map<String, dynamic> json) =>
      WeatherModelData(

        weather: List<WeatherData>.from(json["weather"].map((map)=>WeatherData.fromJson(map))),
          codeCountry: json["sys"],

        latitude:  json["coord"]["lat"],
        longitude:  json["coord"]["lon"],
        speedWind: json["wind"]["speed"],
        message: json["message"]
      );
}
