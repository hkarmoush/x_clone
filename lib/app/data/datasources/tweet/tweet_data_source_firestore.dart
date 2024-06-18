import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:x_clone/app/data/datasources/tweet/tweet_data_source.dart';

class TweetDataSourceFirestore implements TweetDataSource {
  TweetDataSourceFirestore(this.firestore, this.storage);

  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  @override
  Future<void> createTweet(String content, List<File> images) async {
    final imageUrls = <String>[];

    for (final image in images) {
      final ref =
          storage.ref().child('tweets/${DateTime.now().toIso8601String()}');
      await ref.putFile(image);
      final imageUrl = await ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }

    await firestore.collection('tweets').add({
      'content': content,
      'images': imageUrls,
      'timestamp': Timestamp.now(),
      // Add other necessary fields
    });
  }
}
