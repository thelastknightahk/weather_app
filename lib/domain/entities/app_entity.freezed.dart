// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEntity<T> {
  String? get error => throw _privateConstructorUsedError;
  T? get entity => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppEntityCopyWith<T, AppEntity<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEntityCopyWith<T, $Res> {
  factory $AppEntityCopyWith(
          AppEntity<T> value, $Res Function(AppEntity<T>) then) =
      _$AppEntityCopyWithImpl<T, $Res, AppEntity<T>>;
  @useResult
  $Res call({String? error, T? entity, bool isLoading});
}

/// @nodoc
class _$AppEntityCopyWithImpl<T, $Res, $Val extends AppEntity<T>>
    implements $AppEntityCopyWith<T, $Res> {
  _$AppEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? entity = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppEntityCopyWith<T, $Res>
    implements $AppEntityCopyWith<T, $Res> {
  factory _$$_AppEntityCopyWith(
          _$_AppEntity<T> value, $Res Function(_$_AppEntity<T>) then) =
      __$$_AppEntityCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? error, T? entity, bool isLoading});
}

/// @nodoc
class __$$_AppEntityCopyWithImpl<T, $Res>
    extends _$AppEntityCopyWithImpl<T, $Res, _$_AppEntity<T>>
    implements _$$_AppEntityCopyWith<T, $Res> {
  __$$_AppEntityCopyWithImpl(
      _$_AppEntity<T> _value, $Res Function(_$_AppEntity<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? entity = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_AppEntity<T>(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppEntity<T> extends _AppEntity<T> {
  _$_AppEntity({this.error, this.entity, this.isLoading = false}) : super._();

  @override
  final String? error;
  @override
  final T? entity;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AppEntity<$T>(error: $error, entity: $entity, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppEntity<T> &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error,
      const DeepCollectionEquality().hash(entity), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppEntityCopyWith<T, _$_AppEntity<T>> get copyWith =>
      __$$_AppEntityCopyWithImpl<T, _$_AppEntity<T>>(this, _$identity);
}

abstract class _AppEntity<T> extends AppEntity<T> {
  factory _AppEntity(
      {final String? error,
      final T? entity,
      final bool isLoading}) = _$_AppEntity<T>;
  _AppEntity._() : super._();

  @override
  String? get error;
  @override
  T? get entity;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_AppEntityCopyWith<T, _$_AppEntity<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
