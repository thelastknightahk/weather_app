import 'package:wealther_app/data/network/api_client.dart';
import 'package:wealther_app/data/repositories/weather_fetch_repository_imp.dart';
import 'package:wealther_app/data/repositories/weather_offline_repositoy_imp.dart';
import 'package:wealther_app/domain/repositories/weather_fetch_repository.dart';
import 'package:wealther_app/domain/repositories/weather_offline_repository.dart';
import 'package:wealther_app/global/services/database_service.dart';
import 'package:wealther_app/injection/injector.dart';

class RepositoryInjection {
  static void inject() {
    injector.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImp(
        injector.get<ApiClient>(),
      ),
    );
    injector.registerLazySingleton<WeatherOfflineRepository>(
      () => WeatherOfflineRepositoryImp(
        injector.get<DatabaseService>(),
      ),
    );
  }
}
