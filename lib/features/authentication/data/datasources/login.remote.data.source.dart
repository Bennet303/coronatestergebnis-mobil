import '../models/user.model.dart';
import '../../domain/entities/credentials.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRemoteDataSource {
  Future login(Credentials credentials);
  Future<bool> isLoggedIn();
  Future<UserModel> getCurrentUser();
}
