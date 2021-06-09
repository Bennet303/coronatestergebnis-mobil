import '../models/user.model.dart';
import '../../domain/entities/credentials.dart';

abstract class LoginRemoteDataSource {
  void login(Credentials credentials);
  bool isLoggedIn();
  UserModel getCurrentUser();
}
  