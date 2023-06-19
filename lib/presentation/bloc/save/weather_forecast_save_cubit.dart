import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wealther_app/domain/entities/user/city_info.dart';
import 'package:wealther_app/domain/entities/weather/weather_model.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_delete_city_usecase.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_get_cities_usecase.dart';
import 'package:wealther_app/domain/use_cases/offline/weather_get_city_usecase.dart';

import '../../../domain/entities/app_entity.dart';
import '../../../domain/entities/user/city_offline.dart';
import '../../../domain/entities/weather/forcast_model.dart';
import '../../../domain/use_cases/offline/weather_save_city_usecase.dart';

part 'weather_forecast_save_cubit.freezed.dart';
part 'weather_forecast_save_state.dart';

class WeatherForecastSaveCubit extends Cubit<WeatherForecastSaveState> {
  final WeatherSaveCityUseCase _weatherSaveCityUseCase;
  final WeatherDeleteCityUseCase _weatherDeleteCityUseCase;
  final WeatherGetCitiesUseCase _weatherGetCitiesUseCase;
  final WeatherGetCityUseCase _weatherGetCityUseCase;

  WeatherForecastSaveCubit(
      this._weatherSaveCityUseCase,
      this._weatherDeleteCityUseCase,
      this._weatherGetCitiesUseCase,
      this._weatherGetCityUseCase,
      {WeatherForecastSaveState? state})
      : super(state ?? WeatherForecastSaveState.initial());

  Future<void> saveCityData(WeatherModel weatherModel) async {
    _weatherSaveCityUseCase(weatherModel);
    emit(state.copyWith(saved: true, fetchSavedData: false));
  }

  Future<void> deleteCityData(CityInfo cityInfo) async {
    _weatherDeleteCityUseCase(cityInfo);
    emit(state.copyWith(deleted: true,fetchSavedData: false));
  }
  Future<void> updateFetchData(bool fetched) async {
    emit(state.copyWith(fetchSavedData: fetched));
  }
  Future<void> getCitiesList() async {
    final AppEntity<List<CityOffline>> cityListData =
        await _weatherGetCitiesUseCase();
    emit(state.copyWith(cityListAppEntity: cityListData));
  }

  Future<void> getCityDetailInfo(String cityName) async {
    final AppEntity<ForecastModel> cityDetailData =
        await _weatherGetCityUseCase(cityName);

    emit(state.copyWith(cityDetailAppEntity: cityDetailData));
  }

  Future<void> setSelectedCityIndex(int cityIndex) async {
    emit(state.copyWith(saveSelectedCityIndex: cityIndex));
  }

  Future<void> setSelectedDayIndex(int dayIndex) async {
    emit(state.copyWith(saveSelectedDayIndex: dayIndex));
  }
  Future<void> setSelectedCityId(int cityId) async {
    emit(state.copyWith(saveSelectedCityId: cityId));
  }

}
