import 'package:news_app_clean_architecture/_weather_news/domain/weather_entites/weather_model.dart';

abstract class WeatherBaseRepository {
  Future<WeatherModel> getWeatherByLanAndLat();

  Future<WeatherModel> getWeatherByCountry(WeatherParameter weatherParameter);
}
