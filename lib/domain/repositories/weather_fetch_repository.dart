import 'package:wealther_app/domain/entities/weather/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeatherForecast({String city});
}
