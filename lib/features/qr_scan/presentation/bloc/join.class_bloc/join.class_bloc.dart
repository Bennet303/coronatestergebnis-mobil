import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/usecases/join.class.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'join.class_event.dart';
part 'join.class_state.dart';

class JoinClassBloc extends Bloc<JoinClassEvent, JoinClassState> {
  final JoinClassUsecase joinClassUsecase;
  final AuthenticationBloc authenticationBloc;

  JoinClassBloc(this.joinClassUsecase, this.authenticationBloc)
      : super(JoinClassInitial());
  @override
  Stream<JoinClassState> mapEventToState(
    JoinClassEvent event,
  ) async* {
    if (event is JoinClass) {
      yield JoinClassLoading();
      final failureOrSuccess = await joinClassUsecase(
        qrCode: event.qrCode,
        inputFirstname: event.inputFirstname,
        inputLastname: event.inputLastname,
      );
      yield failureOrSuccess.fold(
        (failure) => JoinClassFailed(),
        (r) {
          authenticationBloc.add(AuthenticationRefreshUser());
          return JoinClassSuccessful();
        },
      );
    }
  }
}
