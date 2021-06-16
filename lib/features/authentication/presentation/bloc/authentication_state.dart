part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationFailed extends AuthenticationState {
  final String message;

  AuthenticationFailed(this.message);
}

class UserSignedIn extends AuthenticationState {
  final UserModel user;

  UserSignedIn(this.user);
}

class RegisterSuccessful extends AuthenticationState {}
