import 'package:x_clone/app/domain/entities/user/user.dart';
import 'package:x_clone/app/domain/repositories/auth_repository.dart';

class AuthStateChanges {
  AuthStateChanges(this.repository);
  
  final AuthRepository repository;

  Stream<User?> call() {
    return repository.authStateChanges;
  }
}
