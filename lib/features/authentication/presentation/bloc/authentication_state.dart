part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationFailed extends AuthenticationState {
  final String message;

  AuthenticationFailed(this.message);

  @override
  List<Object?> get props => [];
}

class UserSignedIn extends AuthenticationState {
  final UserModel user;

  UserSignedIn(this.user);

  @override
  List<Object?> get props => [];
}

class RegisterSuccessful extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
