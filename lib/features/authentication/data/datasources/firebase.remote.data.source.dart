import 'package:coronatestergebnis_app/features/authentication/domain/entities/credentials.dart';

import 'package:coronatestergebnis_app/features/authentication/data/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login.remote.data.source.dart';
class FirebaseRemoteDataSource extends LoginRemoteDataSource {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  UserModel getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  bool isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  void login(Credentials credentials) {
    // TODO: implement login
  }

}