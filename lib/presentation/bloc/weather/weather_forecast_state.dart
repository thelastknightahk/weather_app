part of 'weather_forecast_cubit.dart';

@freezed
class WeatherForecastState with _$WeatherForecastState {
  factory WeatherForecastState(
      {AppEntity<WeatherModel>? appEntity,
      int? selectedIndex}) = _WeatherForecastState;

  factory WeatherForecastState.initial() => WeatherForecastState();
}
