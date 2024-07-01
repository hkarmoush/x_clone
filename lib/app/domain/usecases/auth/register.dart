import 'package:injectable/injectable.dart';
import 'package:x_clone/app/domain/entities/auth/registration_details.dart';
import 'package:x_clone/app/domain/entities/user/user.dart';
import 'package:x_clone/app/domain/repositories/auth_repository.dart';

@injectable
class Register {
  final AuthRepository repository;

  Register(this.repository);

  Future<UserEntity> call(RegistrationDetails details) {
    return repository.register(details);
  }
}
