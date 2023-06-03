// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ForecastDay _$$_ForecastDayFromJson(Map<String, dynamic> json) =>
    _$_ForecastDay(
      date: json['date'] as String?,
      hour: (json['hour'] as List<dynamic>?)
          ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
