import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_clone/app/domain/entities/tweet/tweet.dart';

part 'tweet_model.freezed.dart';
part 'tweet_model.g.dart';

@freezed
class TweetModel with _$TweetModel {
  const factory TweetModel({
    required String id,
    required String content,
    required String authorId,
    required DateTime timestamp,
    @Default(0) likes,
    @Default(0) int retweets,
    @Default(0) int replies,
  }) = _TweetModel;

  factory TweetModel.fromJson(Map<String, dynamic> json) =>
      _$TweetModelFromJson(json);

  factory TweetModel.fromEntity(TweetEntity tweet) {
    return TweetModel(
      id: tweet.id,
      content: tweet.content,
      authorId: tweet.authorId,
      timestamp: tweet.timestamp,
      likes: tweet.likes,
      retweets: tweet.retweets,
      replies: tweet.replies,
    );
  }
}

extension ToEntity on TweetModel {
  TweetEntity toEntity() {
    return TweetEntity(
      id: id,
      content: content,
      authorId: authorId,
      timestamp: timestamp,
      likes: likes,
      retweets: retweets,
      replies: replies,
    );
  }
}
