import 'package:injectable/injectable.dart';
import 'package:x_clone/app/app.dart';
import 'package:x_clone/app/view/configure_dependencies.dart';
import 'package:x_clone/bootstrap.dart';

void main() async {
  await configureDependencies(Environment.prod);
  await bootstrap(() => const App());
}
