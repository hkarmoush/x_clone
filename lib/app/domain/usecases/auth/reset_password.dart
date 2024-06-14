import 'package:injectable/injectable.dart';
import 'package:x_clone/app/domain/repositories/auth_repository.dart';

@injectable
class ResetPassword {
  ResetPassword(this.repository);

  final AuthRepository repository;

  Future<void> call(String email) {
    return repository.resetPassword(email);
  }
}
