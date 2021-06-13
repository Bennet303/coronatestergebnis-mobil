import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_page_event.dart';
part 'authentication_page_state.dart';

class AuthenticationPageBloc
    extends Bloc<AuthenticationPageEvent, AuthenticationPageState> {
  AuthenticationPageBloc() : super(AuthenticationSignInPage());

  @override
  Stream<AuthenticationPageState> mapEventToState(
    AuthenticationPageEvent event,
  ) async* {
    if (event is AuthenticationSignInSelected &&
        this.state is AuthenticationRegisterPage) {
      yield AuthenticationSignInPage();
    }

    if (event is AuthenticationRegisterSelected &&
        this.state is AuthenticationSignInPage) {
      yield AuthenticationRegisterPage();
    }
  }
}
