import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/test.result.dart';
import 'package:coronatestergebnis_app/features/home/domain/repositories/test.result.repository.dart';
import 'package:dartz/dartz.dart';

class GetTestResultUsecase {
  TestResultRepository _repository;

  GetTestResultUsecase(this._repository);

  Future<Either<Failure, TestResult>> call() async {
    return await _repository.getTestResults();
  }
}
