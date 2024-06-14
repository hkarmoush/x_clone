import 'package:x_clone/app/domain/entities/user/user.dart';

abstract class AuthRepository {
  Future<User> signIn(String email, String password);
  Future<void> signOut();
  Future<User> register(String email, String password);
  Future<void> resetPassword(String email);
  Stream<User?> get authStateChanges;
}