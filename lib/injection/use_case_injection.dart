import 'package:wealther_app/domain/repositories/weather_fetch_repository.dart';
import 'package:wealther_app/domain/repositories/weather_offline_repository.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_delete_city_usecase.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_get_cities_usecase.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_get_city_usecase.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_save_city_usecase.dart';
import 'package:wealther_app/domain/use_cases/weather_forecast_use_case.dart';
import 'package:wealther_app/injection/injector.dart';

class UseCaseInjection {
  static void inject() {
    injector.registerLazySingleton<WeatherForecastUseCase>(
      () => WeatherForecastUseCase(
        injector.get<WeatherRepository>(),
      ),
    );

    injector.registerLazySingleton<WeatherSaveCityUseCase>(
      () => WeatherSaveCityUseCase(
        injector.get<WeatherOfflineRepository>(),
      ),
    );

    injector.registerLazySingleton<WeatherDeleteCityUseCase>(
      () => WeatherDeleteCityUseCase(
        injector.get<WeatherOfflineRepository>(),
      ),
    );

    injector.registerLazySingleton<WeatherGetCitiesUseCase>(
      () => WeatherGetCitiesUseCase(
        injector.get<WeatherOfflineRepository>(),
      ),
    );

    injector.registerLazySingleton<WeatherGetCityUseCase>(
      () => WeatherGetCityUseCase(
        injector.get<WeatherOfflineRepository>(),
      ),
    );
  }
}
