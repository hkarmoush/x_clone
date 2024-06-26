import 'package:injectable/injectable.dart';
import 'package:x_clone/app/app.dart';
import 'package:x_clone/app/presentation/configure_dependencies.dart';
import 'package:x_clone/bootstrap.dart';

void main() async {
  await configureDependencies(Environment.dev);
  await bootstrap(() => const App());
}
