part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationSignIn extends AuthenticationEvent {
  final Credentials credentials;

  AuthenticationSignIn(this.credentials);
}

class AuthenticationRegister extends AuthenticationEvent {}
