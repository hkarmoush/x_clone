import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:x_clone/app/presentation/configure_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String environment) async {
  getIt.init(environment: environment);
}
