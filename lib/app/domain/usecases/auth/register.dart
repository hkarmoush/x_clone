import 'package:injectable/injectable.dart';
import 'package:x_clone/app/domain/entities/user/user.dart';
import 'package:x_clone/app/domain/repositories/auth_repository.dart';

@injectable
class Register {
  Register(this.repository);

  final AuthRepository repository;

  Future<UserEntity> call(String email, String password) {
    return repository.register(email, password);
  }
}
