import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/entities/credentials.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/repositories/login.repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase {
  final LoginRepository _repository;

  RegisterUsecase(this._repository);

  Future<Either<Failure, void>> call(
      {required Credentials credentials,
      required String firstname,
      required String lastname}) async {
    return await _repository.register(
        credentials: credentials, firstname: firstname, lastname: lastname);
  }
}
