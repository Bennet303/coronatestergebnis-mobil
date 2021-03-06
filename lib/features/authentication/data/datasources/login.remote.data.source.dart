import '../models/user.model.dart';
import '../../domain/entities/credentials.dart';

abstract class LoginRemoteDataSource {
  Future<void> login(Credentials credentials);
  Future<bool> isLoggedIn();
  Future<UserModel> getCurrentUser();
  Future<void> register(
      Credentials credentials, String firstname, String lastname);
}
