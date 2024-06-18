import 'dart:io';

abstract class TweetRepository {
  Future<void> createTweet(String content, List<File> images);
}
