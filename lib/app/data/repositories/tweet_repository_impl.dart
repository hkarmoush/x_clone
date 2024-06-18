import 'dart:io';
import 'package:x_clone/app/data/datasources/tweet/tweet_data_source.dart';
import 'package:x_clone/app/domain/repositories/tweet_repository.dart';

class TweetRepositoryImpl implements TweetRepository {
  TweetRepositoryImpl(this.dataSource);

  final TweetDataSource dataSource;

  @override
  Future<void> createTweet(String content, List<File> images) async {
    await dataSource.createTweet(content, images);
  }
}
