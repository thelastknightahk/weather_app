import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wealther_app/domain/entities/weather/forecast_day.dart';

part 'forcast_model.freezed.dart';
part 'forcast_model.g.dart';

@Freezed(toJson: false)
class ForecastModel with _$ForecastModel {
  factory ForecastModel(
          {@JsonKey(name: 'forecastday') List<ForecastDay>? forecastday}) =
      _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);
}
