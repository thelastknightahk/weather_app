import 'package:wealther_app/domain/use_cases/offline/weather_delete_city_usecase.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_get_cities_usecase.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_get_city_usecase.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_save_city_usecase.dart';
import 'package:wealther_app/domain/use_cases/weather_forecast_use_case.dart';
import 'package:wealther_app/injection/injector.dart';
import 'package:wealther_app/presentation/bloc/save/weather_forecast_save_cubit.dart';
import 'package:wealther_app/presentation/bloc/weather/weather_forecast_cubit.dart';

class BlocInjection {
  static void inject() {
    injector.registerLazySingleton<WeatherForecastCubit>(
      () => WeatherForecastCubit(injector.get<WeatherForecastUseCase>()),
    );
    injector.registerLazySingleton<WeatherForecastSaveCubit>(
      () => WeatherForecastSaveCubit(
        injector.get<WeatherSaveCityUseCase>(),
        injector.get<WeatherDeleteCityUseCase>(),
        injector.get<WeatherGetCitiesUseCase>(),
        injector.get<WeatherGetCityUseCase>(),
      ),
    );
  }
}
