import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:x_clone/app/data/datasources/user/firestore_user_datasource.dart';
import 'package:x_clone/app/data/datasources/user/user_datasource.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  UserDataSource get userDataSource => UserDataSourceFirestore(firestore);
}
