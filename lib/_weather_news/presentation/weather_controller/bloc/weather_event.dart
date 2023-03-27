class WeatherEvent {}

class FetchWeatherDataEvent extends WeatherEvent {
  dynamic context;
  FetchWeatherDataEvent({required this.context});
}

class FetchWeatherDataByCountryNameEvent extends WeatherEvent {
  dynamic context;
  String? country;
  FetchWeatherDataByCountryNameEvent({required this.context ,required this.country});
}

class ChangesEvent extends WeatherEvent {
  dynamic context;
  ChangesEvent({required this.context});
}
