import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wealther_app/domain/entities/weather/condition_model.dart';

part 'current_model.freezed.dart';
part 'current_model.g.dart';

@JsonSerializable(createFactory: false)
@Freezed()
class CurrentModel with _$CurrentModel {
  factory CurrentModel({
    @JsonKey(name: 'temp_c') double? tempC,
    @JsonKey(name: 'temp_f') double? tempF,
    @JsonKey(name: 'is_day') int? isDay,
    @JsonKey(name: 'condition') ConditionModel? condition,
    @JsonKey(name: 'pressure_mb') double? pressureMb,
    @JsonKey(name: 'pressure_in') double? pressureIn,
    @JsonKey(name: 'humidity') int? humidity,
    @JsonKey(name: 'cloud') int? cloud,
    @JsonKey(name: 'feelslike_c') double? feelslikeC,
    @JsonKey(name: 'feelslike_f') double? feelslikeF,
  }) = _CurrentModel;

  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentModelToJson(this);
}
