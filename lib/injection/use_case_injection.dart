import 'package:wealther_app/domain/repositories/weather_fetch_repository.dart';
import 'package:wealther_app/domain/use_cases/weather_forecast_use_case.dart';
import 'package:wealther_app/injection/injector.dart';

class UseCaseInjection {
  static void inject() {
    injector.registerLazySingleton<WeatherForecastUseCase>(
      () => WeatherForecastUseCase(
        injector.get<WeatherRepository>(),
      ),
    );
  }
}
