import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_model.freezed.dart';
part 'condition_model.g.dart';

@JsonSerializable(createFactory: false)
@Freezed()
class ConditionModel with _$ConditionModel {
  factory ConditionModel(
      {@JsonKey(name: 'text') String? text,
      @JsonKey(name: 'icon') String? icon,
      @JsonKey(name: 'code') int? code}) = _ConditionModel;

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}
