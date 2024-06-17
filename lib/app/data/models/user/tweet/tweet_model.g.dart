// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TweetModelImpl _$$TweetModelImplFromJson(Map<String, dynamic> json) =>
    _$TweetModelImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      authorId: json['authorId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      likes: json['likes'] ?? 0,
      retweets: (json['retweets'] as num?)?.toInt() ?? 0,
      replies: (json['replies'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TweetModelImplToJson(_$TweetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'authorId': instance.authorId,
      'timestamp': instance.timestamp.toIso8601String(),
      'likes': instance.likes,
      'retweets': instance.retweets,
      'replies': instance.replies,
    };
