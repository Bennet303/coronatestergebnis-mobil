import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/entities/credentials.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/usecases/sign.in.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignInUsecase signInUsecase;

  AuthenticationBloc(this.signInUsecase) : super(AuthenticationInitial());
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationSignIn) {
      final failureOrSuccess = await signInUsecase(event.credentials);
      yield failureOrSuccess.fold(
        (failure) => AuthenticationFailed(failure.message),
        (r) {
          return SignInSuccessful();
        },
      );
    }
  }
}
