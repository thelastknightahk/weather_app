import 'package:wealther_app/domain/entities/user/city_info.dart';
import 'package:wealther_app/domain/repositories/weather_offline_repository.dart';
import 'package:wealther_app/domain/use_cases/usecase_base.dart';

class WeatherDeleteCityUseCase implements NormalFutureUseCase<CityInfo, void> {
  final WeatherOfflineRepository _weatherOfflineRepository;

  WeatherDeleteCityUseCase(this._weatherOfflineRepository);
  @override
  Future<void> call(CityInfo cityInfo) {
    return _weatherOfflineRepository.deleteSaveCity(cityInfo);
  }
}
