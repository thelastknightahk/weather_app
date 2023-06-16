import 'package:wealther_app/domain/entities/user/city_info.dart';
import 'package:wealther_app/domain/entities/weather/weather_model.dart';

import '../entities/user/city_offline.dart';
import '../entities/weather/forcast_model.dart';

abstract class WeatherOfflineRepository {
  Future<void> saveCityWeatherInfo(WeatherModel weatherModel);
  Future<void> deleteSaveCity(CityInfo cityInfo);

  Future<List<CityOffline>> getSaveCitiesList();
  Future<ForecastModel> getSaveCityWeatherInfo(String cityName);
}
