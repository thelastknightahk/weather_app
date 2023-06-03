import 'package:wealther_app/domain/entities/weather/weather_model.dart';
import 'package:wealther_app/domain/repositories/weather_fetch_repository.dart';

import '../network/api_client.dart';

class WeatherRepositoryImp implements WeatherRepository {
  final ApiClient _apiClient;

  WeatherRepositoryImp(this._apiClient);

  @override
  Future<WeatherModel> getWeatherForecast({String? city}) {
    return _apiClient.fetchweatherForecastData(city);
  }
}
