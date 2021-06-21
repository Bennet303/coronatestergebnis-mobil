part of 'join.class_bloc.dart';

@immutable
abstract class JoinClassEvent {}

class JoinClass extends JoinClassEvent {
  final QrCode qrCode;
  final String inputFirstname;
  final String inputLastname;

  JoinClass({
    required this.qrCode,
    required this.inputFirstname,
    required this.inputLastname,
  });
}
