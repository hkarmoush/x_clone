import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:x_clone/app/data/datasources/profile/profile_data_source.dart';
import 'package:x_clone/app/data/models/user/tweet/tweet_model.dart';
import 'package:x_clone/app/domain/entities/tweet/tweet.dart';

class ProfileDataSourceFirestore implements ProfileDataSource {
  final FirebaseFirestore firestore;

  ProfileDataSourceFirestore(this.firestore);

  @override
  Future<List<TweetEntity>> fetchProfileTweets(
      String userId, int page, int limit) async {
    final querySnapshot = await firestore
        .collection('tweets')
        .where('authorId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .get();

    return querySnapshot.docs
        .map((doc) => TweetModel.fromJson(doc.data()).toEntity())
        .toList();
  }
}
