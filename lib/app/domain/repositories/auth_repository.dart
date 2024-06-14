import 'package:x_clone/app/domain/entities/user/user.dart';

abstract class AuthRepository {
  Future<UserEntity> signIn(String email, String password);
  Future<void> signOut();
  Future<UserEntity> register(String email, String password);
  Future<void> resetPassword(String email);
  Stream<UserEntity?> get authStateChanges;
}
