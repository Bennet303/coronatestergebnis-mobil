part of 'join.class_bloc.dart';

@immutable
abstract class JoinClassState extends Equatable {}

class JoinClassInitial extends JoinClassState {
  @override
  List<Object?> get props => [];
}

class JoinClassFailed extends JoinClassState {
  @override
  List<Object?> get props => [];
}

class JoinClassLoading extends JoinClassState {
  @override
  List<Object?> get props => [];
}

class JoinClassSuccessful extends JoinClassState {
  JoinClassSuccessful();

  @override
  List<Object?> get props => [];
}
