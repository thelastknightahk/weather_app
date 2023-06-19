import 'package:wealther_app/domain/repositories/weather_offline_repository.dart';
import '../../entities/weather/weather_model.dart';
import '../usecase_base.dart';

class WeatherSaveCityUseCase
    implements NormalFutureUseCase<WeatherModel, void> {
  final WeatherOfflineRepository _weatherOfflineRepository;

  WeatherSaveCityUseCase(this._weatherOfflineRepository);
  @override
  Future<void> call(WeatherModel weatherModel) {
    return _weatherOfflineRepository.saveCityWeatherInfo(weatherModel);
  }
}
