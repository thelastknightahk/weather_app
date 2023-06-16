import 'package:wealther_app/domain/entities/app_entity.dart';
import 'package:wealther_app/domain/use_cases/usecase_base.dart';

import '../../entities/weather/forcast_model.dart';
import '../../repositories/weather_offline_repository.dart';

class WeatherGetCityUseCase
    implements NormalFutureUseCase<String, AppEntity<ForecastModel>> {
  final WeatherOfflineRepository _weatherOfflineRepository;

  WeatherGetCityUseCase(this._weatherOfflineRepository);

  @override
  Future<AppEntity<ForecastModel>> call(String cityName) async {
    return AppEntity<ForecastModel>.success(
        await _weatherOfflineRepository.getSaveCityWeatherInfo(cityName));
  }
}
