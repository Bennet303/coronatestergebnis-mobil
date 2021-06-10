import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String email,
    required String firstname,
    required String lastname,
  }) : super(email: email, firstname: firstname, lastname: lastname);
}
