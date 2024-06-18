part of 'create_tweet_bloc.dart';

abstract class CreateTweetEvent extends Equatable {
  const CreateTweetEvent();

  @override
  List<Object> get props => [];
}

class CreateTweet extends CreateTweetEvent {
  const CreateTweet({
    required this.content,
    required this.images,
  });

  final String content;
  final List<File> images;

  @override
  List<Object> get props => [content, images];
}
