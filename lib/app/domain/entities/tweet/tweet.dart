import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet.freezed.dart';

@freezed
class TweetEntity with _$TweetEntity {
  const factory TweetEntity({
    required String id,
    required String content,
    required String authorId,
    required DateTime timestamp,
    @Default(0) likes,
    @Default(0) int retweets,
    @Default(0) int replies,
  }) = _TweetEntity;
}
