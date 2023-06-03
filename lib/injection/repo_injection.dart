import 'package:wealther_app/data/network/api_client.dart';
import 'package:wealther_app/data/repositories/weather_fetch_repository_imp.dart';
import 'package:wealther_app/domain/repositories/weather_fetch_repository.dart';
import 'package:wealther_app/injection/injector.dart';

class RepositoryInjection {
  static void inject() {
    injector.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImp(
        injector.get<ApiClient>(),
      ),
    );
  }
}
