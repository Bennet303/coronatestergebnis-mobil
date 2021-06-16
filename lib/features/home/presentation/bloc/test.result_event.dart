part of 'test.result_bloc.dart';

abstract class TestResultEvent extends Equatable {
  const TestResultEvent();
}

class GetTestResult extends TestResultEvent {
  @override
  List<Object?> get props => [];
}
