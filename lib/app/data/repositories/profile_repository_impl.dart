import 'package:x_clone/app/data/datasources/profile/profile_data_source.dart';
import 'package:x_clone/app/domain/entities/tweet/tweet.dart';
import 'package:x_clone/app/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.dataSource);

  final ProfileDataSource dataSource;

  @override
  Future<List<TweetEntity>> getProfileTweets(
    String userId,
    int page,
    int limit,
  ) {
    return dataSource.fetchProfileTweets(userId, page, limit);
  }
}
