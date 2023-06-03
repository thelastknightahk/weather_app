import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@Freezed(toJson: false)
class LocationModel with _$LocationModel {
  factory LocationModel(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'region') String? region,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon,
      @JsonKey(name: 'tz_id') String? tzId,
      @JsonKey(name: 'localtime') String? localtime}) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
