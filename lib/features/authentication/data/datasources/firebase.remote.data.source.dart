import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/entities/credentials.dart';

import 'package:coronatestergebnis_app/features/authentication/data/models/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login.remote.data.source.dart';

class FirebaseRemoteDataSource extends LoginRemoteDataSource {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;

  @override
  Future<UserModel> getCurrentUser() async {
    final user = auth.currentUser;

    if (user == null) throw Exception('No user is logged in');

    final name = auth.currentUser?.displayName?.split(';') ?? ["", ""];
    return new UserModel(
      email: user.email ?? "",
      firstname: name[0],
      lastname: name[1],
    );
  }

  Future<void> register(
      Credentials credentials, String firstname, String lastname) async {
    await auth.createUserWithEmailAndPassword(
        email: credentials.email, password: credentials.password);
    await store.collection('/usersMobile').doc(credentials.email).set({
      "email": credentials.email,
      "firstname": firstname,
      "lastname": lastname,
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return auth.currentUser != null;
  }

  @override
  Future<void> login(Credentials credentials) async {
    await auth.signInWithEmailAndPassword(
        email: credentials.email, password: credentials.password);
  }
}
