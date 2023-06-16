import 'package:wealther_app/domain/entities/app_entity.dart';
import 'package:wealther_app/domain/repositories/weather_offline_repository.dart';
import 'package:wealther_app/domain/use_cases/usecase_base.dart';

import '../../entities/user/city_offline.dart';

class WeatherGetCitiesUseCase
    implements FutureNoParamsUseCase<AppEntity<List<CityOffline>>> {
  final WeatherOfflineRepository _weatherOfflineRepository;

  WeatherGetCitiesUseCase(this._weatherOfflineRepository);

  @override
  Future<AppEntity<List<CityOffline>>> call() async {
    return AppEntity<List<CityOffline>>.success(
        await _weatherOfflineRepository.getSaveCitiesList());
  }
}
