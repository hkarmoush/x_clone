import 'package:x_clone/app/domain/entities/user/user.dart';
import 'package:x_clone/app/domain/repositories/auth_repository.dart';

class Register {
  Register(this.repository);
  
  final AuthRepository repository;

  Future<User> call(String email, String password) {
    return repository.register(email, password);
  }
}
