part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationSignIn extends AuthenticationEvent {
  final Credentials credentials;

  AuthenticationSignIn(this.credentials);
}

class AuthenticationRegister extends AuthenticationEvent {
  final Credentials credentials;
  final String firstname;
  final String lastname;

  AuthenticationRegister({
    required this.credentials,
    required this.firstname,
    required this.lastname,
  });
}

class AuthenticationInit extends AuthenticationEvent {}

class AuthenticationSignOut extends AuthenticationEvent {}
