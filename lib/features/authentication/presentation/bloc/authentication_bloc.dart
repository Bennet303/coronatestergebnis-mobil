import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/entities/credentials.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/usecases/check.authstatus.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/usecases/register.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/usecases/sign.in.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignInUsecase signInUsecase;
  final RegisterUsecase registerUsecase;
  final CheckAuthstatusUsecase checkAuthstatusUsecase;

  AuthenticationBloc({
    required this.signInUsecase,
    required this.registerUsecase,
    required this.checkAuthstatusUsecase,
  }) : super(AuthenticationInitial());
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationInit) {
      final failureOrUserModel = await checkAuthstatusUsecase();
      if (failureOrUserModel.isRight()) {
        yield SignInSuccessful();
      }
    } else if (event is AuthenticationSignIn) {
      final failureOrSuccess = await signInUsecase(event.credentials);
      yield failureOrSuccess.fold(
        (failure) => AuthenticationFailed(failure.message),
        (r) {
          return SignInSuccessful();
        },
      );
    } else if (event is AuthenticationRegister) {
      final failureOrSuccess = await registerUsecase(
        credentials: event.credentials,
        firstname: event.firstname,
        lastname: event.lastname,
      );
      yield failureOrSuccess.fold(
        (failure) => AuthenticationFailed(failure.message),
        (r) => RegisterSuccessful(),
      );
    }
  }
}
