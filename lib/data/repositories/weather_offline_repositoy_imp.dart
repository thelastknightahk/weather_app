import 'package:wealther_app/domain/entities/user/city_info.dart';
import 'package:wealther_app/domain/entities/weather/weather_model.dart';
import 'package:wealther_app/domain/repositories/weather_offline_repository.dart';
import 'package:wealther_app/global/services/database_service.dart';

import '../../domain/entities/user/city_offline.dart';
import '../../domain/entities/weather/forcast_model.dart';

class WeatherOfflineRepositoryImp implements WeatherOfflineRepository {
  final DatabaseService _databaseService;
  WeatherOfflineRepositoryImp(
    this._databaseService,
  );
  @override
  Future<void> deleteSaveCity(CityInfo cityInfo) {
    return _databaseService.deleteData(cityInfo);
  }

  @override
  Future<void> saveCityWeatherInfo(WeatherModel weatherModel) {
    return _databaseService.insertCityData(weatherModel);
  }

  @override
  Future<List<CityOffline>> getSaveCitiesList() {
    return _databaseService.fetchCitiesData();
  }

  @override
  Future<ForecastModel> getSaveCityWeatherInfo(String cityName) {
    return _databaseService.fetchForecastCityData(cityName);
  }
}
