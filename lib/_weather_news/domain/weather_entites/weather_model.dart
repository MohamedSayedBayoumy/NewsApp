class WeatherModel {
  String? message;
  double? latitude;
  double? longitude;
  String? codeCountry;
  List<Weather>? weather;
  double? speedWind;

  WeatherModel(
      {this.latitude,
      this.longitude,
      this.speedWind,
      this.message,
      this.codeCountry,
      this.weather});
}

class Weather {
  String? description;
  String? icon;
  String? statusWeather;

  Weather(
      {required this.description,
      required this.icon,
      required this.statusWeather});
}

class WeatherParameter {
 
  String? country;

  WeatherParameter({this.country});
}
