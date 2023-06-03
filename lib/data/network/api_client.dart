import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wealther_app/domain/entities/weather/weather_model.dart';
import 'package:wealther_app/global/constants/app_constant.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.weatherapi.com/v1/')
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String? baseUrl,
  }) = _ApiClient;

  @GET(
      '/forecast.json?key=${AppConstants.weatherKey}&days=${AppConstants.forecastDayNum}')
  Future<WeatherModel> fetchweatherForecastData(
    @Query('q') String? city,
  );
}
