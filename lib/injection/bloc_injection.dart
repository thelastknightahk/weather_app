import 'package:wealther_app/domain/use_cases/weather_forecast_use_case.dart';
import 'package:wealther_app/injection/injector.dart';
import 'package:wealther_app/presentation/bloc/weather/weather_forecast_cubit.dart';

class BlocInjection {
  static void inject() {
    injector.registerLazySingleton<WeatherForecastCubit>(
      () => WeatherForecastCubit(injector.get<WeatherForecastUseCase>()),
    );
  }
}
