import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_clone/app/domain/entities/user/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? 'email@notfound.why',
    );
  }

  factory UserModel.mock() {
    return const UserModel(
      uid: '1X4GTDSSDGBFNDFLGJB',
      email: 'testemail@test.com',
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(uid: entity.uid, email: entity.email);
  }
}

extension MapToEntity on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
    );
  }
}
