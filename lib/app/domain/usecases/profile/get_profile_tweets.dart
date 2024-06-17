import 'package:x_clone/app/domain/entities/tweet/tweet.dart';
import 'package:x_clone/app/domain/repositories/profile_repository.dart';

class GetProfileTweets {
  GetProfileTweets(this.repository);

  final ProfileRepository repository;

  Future<List<TweetEntity>> call({
    required String userId,
    int page = 1,
    int limit = 20,
  }) {
    return repository.getProfileTweets(userId, page, limit);
  }
}
