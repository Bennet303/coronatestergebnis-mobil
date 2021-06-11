import 'package:dartz/dartz.dart';

import '../datasources/login.remote.data.source.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/entities/credentials.dart';

import 'package:coronatestergebnis_app/core/error/failure.dart';

import '../../domain/repositories/login.repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, void>> login(Credentials credentials) async {
    return await dataSource.login(credentials);
  }
}
