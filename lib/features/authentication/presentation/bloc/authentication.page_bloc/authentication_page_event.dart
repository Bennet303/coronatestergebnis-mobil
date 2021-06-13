part of 'authentication_page_bloc.dart';

abstract class AuthenticationPageEvent extends Equatable {
  const AuthenticationPageEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationSignInSelected extends AuthenticationPageEvent {}

class AuthenticationRegisterSelected extends AuthenticationPageEvent {}
