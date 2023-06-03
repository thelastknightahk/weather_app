abstract class FutureNoParamsUseCase<Out> {
  Future<Out> call();
}

abstract class NormalFutureUseCase<In, Out> {
  Future<Out> call(In params);
}
