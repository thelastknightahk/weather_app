import 'package:dio/dio.dart';
import 'package:wealther_app/global/services/database_service.dart';
import 'package:wealther_app/injection/injector.dart';

import '../data/network/api_client.dart';

class InfraInjection {
  static Future<void> inject() async {
    final dio = Dio();
    injector.registerLazySingleton<ApiClient>(() => ApiClient(dio));
    injector.registerLazySingleton<DatabaseService>(() => DatabaseService());
  }
}
