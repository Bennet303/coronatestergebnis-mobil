import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/authentication/data/models/user.model.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/repositories/login.repository.dart';
import 'package:dartz/dartz.dart';

class CheckAuthstatusUsecase {
  final LoginRepository _repository;

  CheckAuthstatusUsecase(this._repository);

  Future<Either<Failure, UserModel>> call() async {
    return await _repository.getCurrentUser();
  }
}
