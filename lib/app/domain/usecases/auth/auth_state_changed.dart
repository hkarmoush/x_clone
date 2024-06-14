import 'package:injectable/injectable.dart';
import 'package:x_clone/app/domain/entities/user/user.dart';
import 'package:x_clone/app/domain/repositories/auth_repository.dart';

@injectable
class AuthStateChanges {
  AuthStateChanges(this.repository);

  final AuthRepository repository;

  Stream<UserEntity?> call() {
    return repository.authStateChanges;
  }
}
