import 'package:news_app_clean_architecture/_weather_news/domain/weather_base_repository/base_repository_weather.dart';

import '../weather_entites/weather_model.dart';

class BaseWeatherUseCase {
  final WeatherBaseRepository weatherBaseRepository;

  BaseWeatherUseCase(this.weatherBaseRepository);

  Future<WeatherModel> fetchWeatherByLanAndLat() async {
    return await weatherBaseRepository.getWeatherByLanAndLat();
  }
}
