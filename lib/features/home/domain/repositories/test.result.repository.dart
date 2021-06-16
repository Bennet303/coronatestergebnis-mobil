import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/test.result.dart';
import 'package:dartz/dartz.dart';

abstract class TestResultRepository {
  Future<Either<Failure, TestResult>> getTestResults();
}
