import 'package:coronatestergebnis_app/features/authentication/data/models/user.model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../datasources/login.remote.data.source.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/entities/credentials.dart';

import 'package:coronatestergebnis_app/core/error/failure.dart';

import '../../domain/repositories/login.repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, void>> login(Credentials credentials) async {
    try {
      return Right(await dataSource.login(credentials));
    } catch (e) {
      return Left(AuthFailure('Login failure'));
    }
  }

  @override
  Future<Either<Failure, void>> register(
      {required Credentials credentials,
      required String firstname,
      required String lastname}) async {
    try {
      return Right(await dataSource.register(credentials, firstname, lastname));
    } catch (e) {
      return Left(AuthFailure('Register failure'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getCurrentUser() async {
    try {
      return Right(await dataSource.getCurrentUser());
    } catch (e) {
      return Left(AuthFailure('No User logged in'));
    }
  }
}

class AuthFailure extends Failure {
  AuthFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}
