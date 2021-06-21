import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String firstname;
  final String lastname;
  final String email;

  final List<Child> childs;

  User(
      {required this.childs,
      required this.firstname,
      required this.lastname,
      required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [firstname, lastname, email, childs];
}
