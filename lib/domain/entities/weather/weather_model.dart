import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wealther_app/domain/entities/weather/current_model.dart';
import 'package:wealther_app/domain/entities/weather/forcast_model.dart';
import 'package:wealther_app/domain/entities/weather/location_model.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@JsonSerializable(createFactory: false)
@Freezed()
class WeatherModel with _$WeatherModel {
  factory WeatherModel(
      {@JsonKey(name: 'location') LocationModel? location,
      @JsonKey(name: 'current') CurrentModel? current,
      @JsonKey(name: 'forecast') ForecastModel? forecast}) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
