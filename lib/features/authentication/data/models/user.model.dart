import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';

import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required String email,
      required String firstname,
      required String lastname,
      required List<Child> childs})
      : super(
            childs: childs,
            email: email,
            firstname: firstname,
            lastname: lastname);
}
