import 'dart:io';

abstract class TweetDataSource {
  Future<void> createTweet(String content, List<File> images);
}
