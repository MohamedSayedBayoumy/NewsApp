
class WeatherEvent {}

class FetchWeatherDataEvent extends WeatherEvent {
  dynamic context;
  FetchWeatherDataEvent({required this.context});
}


class ChangesEvent extends WeatherEvent {
  dynamic context;
  ChangesEvent({required this.context});
}
