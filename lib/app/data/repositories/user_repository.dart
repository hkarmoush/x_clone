import 'package:injectable/injectable.dart';
import 'package:x_clone/app/data/datasources/user/user_datasource.dart';
import 'package:x_clone/app/data/models/user/user_model.dart';
import 'package:x_clone/app/domain/entities/user/user.dart';
import 'package:x_clone/app/domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<UserEntity> getUserProfile(String uid) async {
    final model = await dataSource.fetchUserProfile(uid);
    return model.toEntity();
  }

  @override
  Future<void> updateUserProfile(UserEntity user) async {
    final model = UserModel.fromEntity(user);
    await dataSource.updateUserProfile(model);
  }
}
