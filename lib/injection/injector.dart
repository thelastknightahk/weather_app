import 'package:get_it/get_it.dart';
import 'package:wealther_app/injection/bloc_injection.dart';
import 'package:wealther_app/injection/infra_injection.dart';
import 'package:wealther_app/injection/repo_injection.dart';
import 'package:wealther_app/injection/use_case_injection.dart';

GetIt injector = GetIt.instance;

Future<void> initDependenciesInjection() async {
  // App
  await InfraInjection.inject();
  // Repository
  RepositoryInjection.inject();
  // UseCase
  UseCaseInjection.inject();
  // Bloc
  BlocInjection.inject();
}
