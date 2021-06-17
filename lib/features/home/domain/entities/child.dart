import 'package:equatable/equatable.dart';

class Child extends Equatable{
  final String firstname;
  final String lastname;
  final String id;
  final String classID;

  Child(
      {required this.classID,
      required this.id,
      required this.firstname,
      required this.lastname});

  @override
  List<Object?> get props => [id];
}
