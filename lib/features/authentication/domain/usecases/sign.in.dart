import 'package:coronatestergebnis_app/features/authentication/data/models/user.model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/login.repository.dart';
import '../entities/credentials.dart';

class SignInUsecase {
  final LoginRepository _repository;

  SignInUsecase(this._repository);

  Future<Either<Failure, UserModel>> call(Credentials credentials) async {
    await _repository.login(credentials);
    return _repository.getCurrentUser();
  }
}
