import 'package:flutter/material.dart';
import 'package:x_clone/app/data/models/user/tweet/tweet_model.dart';

class TweetItem extends StatelessWidget {
  const TweetItem({required this.tweet, super.key});

  final TweetModel tweet;

  @override
  Widget build(BuildContext context) {
    final author = tweet.authorId;
    final likes = tweet.likes;
    final retweets = tweet.retweets;
    return Card(
      child: ListTile(
        title: Text(tweet.content),
        subtitle: Text('Author: $author\nLikes: $likes Retweets: $retweets'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                // Handle like action
              },
            ),
            IconButton(
              icon: const Icon(Icons.repeat),
              onPressed: () {
                // Handle retweet action
              },
            ),
            IconButton(
              icon: const Icon(Icons.reply),
              onPressed: () {
                // Handle reply action
              },
            ),
          ],
        ),
      ),
    );
  }
}
