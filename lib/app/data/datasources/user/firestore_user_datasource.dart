import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:x_clone/app/data/datasources/user/user_datasource.dart';
import 'package:x_clone/app/data/models/user/user_model.dart';
import 'package:x_clone/app/domain/entities/user/user.dart';

@injectable
class UserDataSourceFirestore implements UserDataSource {
  UserDataSourceFirestore(this.firestore);

  final FirebaseFirestore firestore;

  @override
  Future<void> createUserRecord(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    await firestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toJson());
  }

  @override
  Future<UserEntity?> getUser(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      final userModel = UserModel.fromJson(doc.data()!);
      return userModel.toEntity();
    }
    return null;
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    await firestore
        .collection('users')
        .doc(userModel.uid)
        .update(userModel.toJson());
  }

  @override
  Future<void> deleteUser(String uid) async {
    await firestore.collection('users').doc(uid).delete();
  }

  @override
  Future<UserModel> fetchUserProfile(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();
    return UserModel.fromJson(doc.data()!);
  }

  @override
  Future<void> updateUserProfile(UserModel user) async {
    await firestore.collection('users').doc(user.uid).update(user.toJson());
  }
}
