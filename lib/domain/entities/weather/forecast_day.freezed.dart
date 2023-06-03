// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) {
  return _ForecastDay.fromJson(json);
}

/// @nodoc
mixin _$ForecastDay {
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'hour')
  List<Hour>? get hour => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastDayCopyWith<ForecastDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastDayCopyWith<$Res> {
  factory $ForecastDayCopyWith(
          ForecastDay value, $Res Function(ForecastDay) then) =
      _$ForecastDayCopyWithImpl<$Res, ForecastDay>;
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String? date,
      @JsonKey(name: 'hour') List<Hour>? hour});
}

/// @nodoc
class _$ForecastDayCopyWithImpl<$Res, $Val extends ForecastDay>
    implements $ForecastDayCopyWith<$Res> {
  _$ForecastDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? hour = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as List<Hour>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForecastDayCopyWith<$Res>
    implements $ForecastDayCopyWith<$Res> {
  factory _$$_ForecastDayCopyWith(
          _$_ForecastDay value, $Res Function(_$_ForecastDay) then) =
      __$$_ForecastDayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String? date,
      @JsonKey(name: 'hour') List<Hour>? hour});
}

/// @nodoc
class __$$_ForecastDayCopyWithImpl<$Res>
    extends _$ForecastDayCopyWithImpl<$Res, _$_ForecastDay>
    implements _$$_ForecastDayCopyWith<$Res> {
  __$$_ForecastDayCopyWithImpl(
      _$_ForecastDay _value, $Res Function(_$_ForecastDay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? hour = freezed,
  }) {
    return _then(_$_ForecastDay(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      hour: freezed == hour
          ? _value._hour
          : hour // ignore: cast_nullable_to_non_nullable
              as List<Hour>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_ForecastDay implements _ForecastDay {
  _$_ForecastDay(
      {@JsonKey(name: 'date') this.date,
      @JsonKey(name: 'hour') final List<Hour>? hour})
      : _hour = hour;

  factory _$_ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$$_ForecastDayFromJson(json);

  @override
  @JsonKey(name: 'date')
  final String? date;
  final List<Hour>? _hour;
  @override
  @JsonKey(name: 'hour')
  List<Hour>? get hour {
    final value = _hour;
    if (value == null) return null;
    if (_hour is EqualUnmodifiableListView) return _hour;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ForecastDay(date: $date, hour: $hour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForecastDay &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._hour, _hour));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_hour));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForecastDayCopyWith<_$_ForecastDay> get copyWith =>
      __$$_ForecastDayCopyWithImpl<_$_ForecastDay>(this, _$identity);
}

abstract class _ForecastDay implements ForecastDay {
  factory _ForecastDay(
      {@JsonKey(name: 'date') final String? date,
      @JsonKey(name: 'hour') final List<Hour>? hour}) = _$_ForecastDay;

  factory _ForecastDay.fromJson(Map<String, dynamic> json) =
      _$_ForecastDay.fromJson;

  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'hour')
  List<Hour>? get hour;
  @override
  @JsonKey(ignore: true)
  _$$_ForecastDayCopyWith<_$_ForecastDay> get copyWith =>
      throw _privateConstructorUsedError;
}
