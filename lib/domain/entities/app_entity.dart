import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_entity.freezed.dart';

@freezed
class AppEntity<T> with _$AppEntity<T> {
  factory AppEntity({
    String? error,
    T? entity,
    @Default(false) bool isLoading,
  }) = _AppEntity<T>;

  AppEntity._();

  factory AppEntity.success(T entity) => AppEntity<T>(entity: entity);
  factory AppEntity.error(String error) => AppEntity<T>(error: error);
  factory AppEntity.loading() => AppEntity<T>(isLoading: true);

  bool get isSuccess => entity != null && error == null;
  bool get isFailure => error != null;
  bool get isDone => entity != null || error != null;
  String get getErrorString => 'Something Went Wrong!';
}
