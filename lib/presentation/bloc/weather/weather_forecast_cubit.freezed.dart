// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherForecastState {
  AppEntity<WeatherModel>? get appEntity => throw _privateConstructorUsedError;
  bool? get cityFound => throw _privateConstructorUsedError;
  int? get selectedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherForecastStateCopyWith<WeatherForecastState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastStateCopyWith<$Res> {
  factory $WeatherForecastStateCopyWith(WeatherForecastState value,
          $Res Function(WeatherForecastState) then) =
      _$WeatherForecastStateCopyWithImpl<$Res, WeatherForecastState>;
  @useResult
  $Res call(
      {AppEntity<WeatherModel>? appEntity,
      bool? cityFound,
      int? selectedIndex});

  $AppEntityCopyWith<WeatherModel, $Res>? get appEntity;
}

/// @nodoc
class _$WeatherForecastStateCopyWithImpl<$Res,
        $Val extends WeatherForecastState>
    implements $WeatherForecastStateCopyWith<$Res> {
  _$WeatherForecastStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appEntity = freezed,
    Object? cityFound = freezed,
    Object? selectedIndex = freezed,
  }) {
    return _then(_value.copyWith(
      appEntity: freezed == appEntity
          ? _value.appEntity
          : appEntity // ignore: cast_nullable_to_non_nullable
              as AppEntity<WeatherModel>?,
      cityFound: freezed == cityFound
          ? _value.cityFound
          : cityFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppEntityCopyWith<WeatherModel, $Res>? get appEntity {
    if (_value.appEntity == null) {
      return null;
    }

    return $AppEntityCopyWith<WeatherModel, $Res>(_value.appEntity!, (value) {
      return _then(_value.copyWith(appEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherForecastStateCopyWith<$Res>
    implements $WeatherForecastStateCopyWith<$Res> {
  factory _$$_WeatherForecastStateCopyWith(_$_WeatherForecastState value,
          $Res Function(_$_WeatherForecastState) then) =
      __$$_WeatherForecastStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppEntity<WeatherModel>? appEntity,
      bool? cityFound,
      int? selectedIndex});

  @override
  $AppEntityCopyWith<WeatherModel, $Res>? get appEntity;
}

/// @nodoc
class __$$_WeatherForecastStateCopyWithImpl<$Res>
    extends _$WeatherForecastStateCopyWithImpl<$Res, _$_WeatherForecastState>
    implements _$$_WeatherForecastStateCopyWith<$Res> {
  __$$_WeatherForecastStateCopyWithImpl(_$_WeatherForecastState _value,
      $Res Function(_$_WeatherForecastState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appEntity = freezed,
    Object? cityFound = freezed,
    Object? selectedIndex = freezed,
  }) {
    return _then(_$_WeatherForecastState(
      appEntity: freezed == appEntity
          ? _value.appEntity
          : appEntity // ignore: cast_nullable_to_non_nullable
              as AppEntity<WeatherModel>?,
      cityFound: freezed == cityFound
          ? _value.cityFound
          : cityFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_WeatherForecastState implements _WeatherForecastState {
  _$_WeatherForecastState(
      {this.appEntity, this.cityFound = false, this.selectedIndex = 0});

  @override
  final AppEntity<WeatherModel>? appEntity;
  @override
  @JsonKey()
  final bool? cityFound;
  @override
  @JsonKey()
  final int? selectedIndex;

  @override
  String toString() {
    return 'WeatherForecastState(appEntity: $appEntity, cityFound: $cityFound, selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherForecastState &&
            (identical(other.appEntity, appEntity) ||
                other.appEntity == appEntity) &&
            (identical(other.cityFound, cityFound) ||
                other.cityFound == cityFound) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, appEntity, cityFound, selectedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherForecastStateCopyWith<_$_WeatherForecastState> get copyWith =>
      __$$_WeatherForecastStateCopyWithImpl<_$_WeatherForecastState>(
          this, _$identity);
}

abstract class _WeatherForecastState implements WeatherForecastState {
  factory _WeatherForecastState(
      {final AppEntity<WeatherModel>? appEntity,
      final bool? cityFound,
      final int? selectedIndex}) = _$_WeatherForecastState;

  @override
  AppEntity<WeatherModel>? get appEntity;
  @override
  bool? get cityFound;
  @override
  int? get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherForecastStateCopyWith<_$_WeatherForecastState> get copyWith =>
      throw _privateConstructorUsedError;
}
