import 'package:x_clone/app/domain/entities/tweet/tweet.dart';

abstract class ProfileDataSource {
  Future<List<TweetEntity>> fetchProfileTweets(
    String userId,
    int page,
    int limit,
  );
}
