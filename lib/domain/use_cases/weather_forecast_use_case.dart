import 'package:wealther_app/domain/entities/app_entity.dart';
import 'package:wealther_app/domain/entities/weather/weather_model.dart';
import 'package:wealther_app/domain/repositories/weather_fetch_repository.dart';
import 'package:wealther_app/domain/use_cases/usecase_base.dart';

class WeatherForecastUseCase
    implements NormalFutureUseCase<String, AppEntity<WeatherModel>> {
  final WeatherRepository _weatherRepository;

  WeatherForecastUseCase(this._weatherRepository);

  @override
  Future<AppEntity<WeatherModel>> call(String? cityData) async {
    return AppEntity<WeatherModel>.success(
        await _weatherRepository.getWeatherForecast(city: cityData!));
  }
}
