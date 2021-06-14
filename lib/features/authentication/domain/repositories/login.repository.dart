import 'package:coronatestergebnis_app/features/authentication/data/models/user.model.dart';

import '../entities/credentials.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> login(Credentials credentials);
  Future<Either<Failure, void>> register(
      {required Credentials credentials,
      required String firstname,
      required String lastname});
  Future<Either<Failure, UserModel>> getCurrentUser();
}
