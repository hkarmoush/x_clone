import 'package:x_clone/app/domain/entities/tweet/tweet.dart';

abstract class ProfileRepository {
  Future<List<TweetEntity>> getProfileTweets(
    String userId,
    int page,
    int limit,
  );
}
