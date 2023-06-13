import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wealther_app/domain/entities/weather/condition_model.dart';

part 'hour.freezed.dart';
part 'hour.g.dart';

@JsonSerializable(createFactory: false)
@Freezed()
class Hour with _$Hour {
  factory Hour(
      {@JsonKey(name: 'time') String? time,
      @JsonKey(name: 'temp_c') double? tempC,
      @JsonKey(name: 'temp_f') double? tempF,
      @JsonKey(name: 'is_day') int? isDay,
      @JsonKey(name: 'condition') ConditionModel? condition,
      @JsonKey(name: 'will_it_rain') int? willItRain,
      @JsonKey(name: 'chance_of_rain') int? chanceOfRain}) = _Hour;

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}
