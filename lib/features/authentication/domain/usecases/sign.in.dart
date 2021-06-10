import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/login.repository.dart';
import '../entities/credentials.dart';

class SignInUsecase {
  final LoginRepository _repository;

  SignInUsecase(this._repository);

  Future<Either<Failure, void>> call(Credentials credentials) async {
    return await _repository.login(credentials);
  }
}
