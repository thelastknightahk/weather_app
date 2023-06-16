part of 'weather_forecast_save_cubit.dart';

@freezed
class WeatherForecastSaveState with _$WeatherForecastSaveState {
  factory WeatherForecastSaveState({
    AppEntity<List<CityOffline>>? cityListAppEntity,
    AppEntity<ForecastModel>? cityDetailAppEntity,
    @Default(0) int? saveSelectedIndex,
    bool? saved,
    bool? deleted,
  }) = _WeatherForecastSaveState;

  factory WeatherForecastSaveState.initial() => WeatherForecastSaveState();
}
