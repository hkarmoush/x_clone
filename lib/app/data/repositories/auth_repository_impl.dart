import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:x_clone/app/data/models/user/user_model.dart';
import 'package:x_clone/app/domain/entities/user/user.dart';
import 'package:x_clone/app/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl(this.firebaseAuth);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final model = UserModel.fromFirebaseUser(userCredential.user!);
    return model.toEntity();
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserEntity> register(String email, String password) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final model = UserModel.fromFirebaseUser(userCredential.user!);
    return model.toEntity();
  }

  @override
  Future<void> resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return firebaseAuth.authStateChanges().map((user) {
      if (user != null) {
        final model = UserModel.fromFirebaseUser(user);
        final entity = model.toEntity();
        return entity;
      }

      return null;
    });
  }
}
