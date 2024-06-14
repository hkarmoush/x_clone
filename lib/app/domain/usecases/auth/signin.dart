import 'package:x_clone/app/domain/entities/user/user.dart';
import 'package:x_clone/app/domain/repositories/auth_repository.dart';

class SignIn {
  SignIn(this.repository);
  final AuthRepository repository;

  Future<UserEntity> call(String email, String password) {
    return repository.signIn(email, password);
  }
}
