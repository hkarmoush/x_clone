import 'dart:io';
import 'package:x_clone/app/domain/repositories/tweet_repository.dart';

class CreateTweetUseCase {
  CreateTweetUseCase(this.repository);

  final TweetRepository repository;

  Future<void> call(String content, List<File> images) async {
    await repository.createTweet(content, images);
  }
}
