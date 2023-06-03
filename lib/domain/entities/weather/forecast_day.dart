import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wealther_app/domain/entities/weather/hour.dart';

part 'forecast_day.freezed.dart';
part 'forecast_day.g.dart';

@Freezed(toJson: false)
class ForecastDay with _$ForecastDay {
  factory ForecastDay(
      {@JsonKey(name: 'date') String? date,
      @JsonKey(name: 'hour') List<Hour>? hour}) = _ForecastDay;

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);
}
