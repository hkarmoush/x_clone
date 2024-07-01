import 'package:x_clone/app/domain/entities/user/user.dart';

class UpdateUserProfile {
  final UserRepository repository;

  UpdateUserProfile(this.repository);

  Future<void> call(UserEntity user) {
    return repository.updateUserProfile(user);
  }
}
