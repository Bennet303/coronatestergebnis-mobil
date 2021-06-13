part of 'authentication_page_bloc.dart';

abstract class AuthenticationPageState extends Equatable {
  const AuthenticationPageState();

  @override
  List<Object> get props => [];
}

class AuthenticationSignInPage extends AuthenticationPageState {}

class AuthenticationRegisterPage extends AuthenticationPageState {}
