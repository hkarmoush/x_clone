import 'package:x_clone/app/domain/entities/user/user.dart';

class GetUserProfile {
  final UserRepository repository;

  GetUserProfile(this.repository);

  Future<UserEntity> call(String uid) {
    return repository.getUserProfile(uid);
  }
}
