import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:wealther_app/domain/use_cases/weather_forecast_use_case.dart';

import '../../../domain/entities/app_entity.dart';
import '../../../domain/entities/weather/weather_model.dart';

part 'weather_forecast_cubit.freezed.dart';
part 'weather_forecast_state.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  final WeatherForecastUseCase _weatherForecastUseCase;
  WeatherForecastCubit(this._weatherForecastUseCase,
      {WeatherForecastState? state})
      : super(state ?? WeatherForecastState.initial());

  Future<void> fetchWeatherData(String city) async {
    final AppEntity<WeatherModel> weatherData =
        await _weatherForecastUseCase(city);

    emit(state.copyWith(
      appEntity: weatherData,
    ));
  }

  Future<void> setSelectedIndex(int index) async {
    emit(state.copyWith(selectedIndex: index));
  }
}
