import 'package:x_clone/app/domain/entities/user/user.dart';

abstract class UserDataSource {
  Future<UserEntity?> getUser(String uid);
  Future<void> createUserRecord(UserEntity user);
  Future<void> updateUser(UserEntity user);
  Future<void> deleteUser(String uid);
}
