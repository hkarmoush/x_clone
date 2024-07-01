import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String uid,
    required String email,
    String? name,
    String? bio,
    String? profilePictureUrl,
    String? bannerImageUrl,
    @Default(0) int followingCount,
    @Default(0) int followersCount,
  }) = _UserEntity;
}
