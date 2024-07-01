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
    String? name,
    String? bio,
    String? profilePictureUrl,
    String? bannerImageUrl,
    @Default(0) int followingCount,
    @Default(0) int followersCount,
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
      name: 'Test User',
      bio: 'This is a test bio.',
      profilePictureUrl: 'https://example.com/profile.jpg',
      bannerImageUrl: 'https://example.com/banner.jpg',
      followingCount: 10,
      followersCount: 100,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      email: entity.email,
      name: entity.name,
      bio: entity.bio,
      profilePictureUrl: entity.profilePictureUrl,
      bannerImageUrl: entity.bannerImageUrl,
      followingCount: entity.followingCount,
      followersCount: entity.followersCount,
    );
  }
}

extension MapToEntity on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      name: name,
      bio: bio,
      profilePictureUrl: profilePictureUrl,
      bannerImageUrl: bannerImageUrl,
      followingCount: followingCount,
      followersCount: followersCount,
    );
  }
}
