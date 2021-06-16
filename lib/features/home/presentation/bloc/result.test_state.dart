part of 'test.result_bloc.dart';

abstract class TestResultState extends Equatable {
  const TestResultState();
}

class TestResultInitial extends TestResultState {
  @override
  List<Object> get props => [];
}

class TestResultLoading extends TestResultState {
  @override
  List<Object?> get props => [];
}

class TestResultLoaded extends TestResultState {
  final TestResult testResult;

  TestResultLoaded(this.testResult);

  @override
  List<Object?> get props => [testResult];
}

class TestResultFailed extends TestResultState {
  final String message;

  TestResultFailed(this.message);

  @override
  List<Object?> get props => [message];
}
