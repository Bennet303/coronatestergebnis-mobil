import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';

class User {
  final String firstname;
  final String lastname;
  final String email;

  final List<Child> childs;

  User(
      {required this.childs,
      required this.firstname,
      required this.lastname,
      required this.email});
}
