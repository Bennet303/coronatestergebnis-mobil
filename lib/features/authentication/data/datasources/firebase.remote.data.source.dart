import 'package:coronatestergebnis_app/features/authentication/domain/entities/credentials.dart';

import 'package:coronatestergebnis_app/features/authentication/data/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login.remote.data.source.dart';

class FirebaseRemoteDataSource extends LoginRemoteDataSource {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  UserModel getCurrentUser() {
    final user = auth.currentUser;
    final name = auth.currentUser?.displayName?.split(';') ?? ["", ""];
    return new UserModel(
      email: user?.email ?? "",
      firstname: name[0],
      lastname: name[1],
    );
  }

  @override
  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  @override
  void login(Credentials credentials) {
    auth.signInWithEmailAndPassword(
        email: credentials.email, password: credentials.password);
  }
}
