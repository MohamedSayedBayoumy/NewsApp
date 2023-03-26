

import '../../domain/weather_entites/weather_model.dart';

class WeatherData extends Weather {
  WeatherData(
      {required super.description,
      required super.icon,
      required super.statusWeather});

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
      description: json["description"],
      icon: json["icon"],
      statusWeather: json["main"]);
}
