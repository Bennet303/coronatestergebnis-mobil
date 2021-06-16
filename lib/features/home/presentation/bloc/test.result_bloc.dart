import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/test.result.dart';
import 'package:coronatestergebnis_app/features/home/domain/usecases/get.test.result.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
part 'test.result_event.dart';
part 'result.test_state.dart';

class TestResultBloc extends Bloc<TestResultEvent, TestResultState> {
  final GetTestResultUsecase getTestResultUsecase;

  TestResultBloc({required this.getTestResultUsecase})
      : super(TestResultInitial());
  @override
  Stream<TestResultState> mapEventToState(
    TestResultEvent event,
  ) async* {
    if (event is GetTestResult) {
      yield TestResultLoading();
      final Either<Failure, TestResult> result = await getTestResultUsecase();
      yield result.fold(
        (l) => TestResultFailed(l.message),
        (r) => TestResultLoaded(r),
      );
    }
  }
}

class TestResultFailure extends Failure {
  TestResultFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}
