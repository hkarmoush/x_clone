import 'package:x_clone/app/domain/entities/user/user.dart';

abstract class UserRepository {
  Future<UserEntity> getUserProfile(String uid);
  Future<void> updateUserProfile(UserEntity user);
}
