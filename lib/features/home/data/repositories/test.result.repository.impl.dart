import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/repositories/login.repository.dart';
import 'package:coronatestergebnis_app/features/home/data/datasources/test.result.data.source.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/test.result.dart';
import 'package:coronatestergebnis_app/features/home/domain/repositories/test.result.repository.dart';
import 'package:coronatestergebnis_app/features/home/presentation/bloc/test.result_bloc.dart';
import 'package:dartz/dartz.dart';

class TestResultRepositoryImpl extends TestResultRepository {
  final LoginRepository loginRepository;
  final TestResultDataSource testResultDataSource;

  TestResultRepositoryImpl({
    required this.loginRepository,
    required this.testResultDataSource,
  });

  @override
  Future<Either<Failure, TestResult>> getTestResults() async {
    final failureOrUser = await loginRepository.getCurrentUser();

    if (failureOrUser.isLeft())
      return Left(TestResultFailure('Problem with retrieving the user'));

    final user = failureOrUser.getOrElse(() => throw Error());

    List<Child> affectedChilds = [];
    for (int i = 0; i < user.childs.length; i++) {
      Child child = user.childs[i];
      final classHasPositiveTestResult =
          await testResultDataSource.getTestResultForClass(child.classID);
      if (classHasPositiveTestResult) affectedChilds.add(child);
    }

    if (affectedChilds.length == 0) {
      return Right(NegativeTestResult(Timestamp.now()));
    } else {
      return Right(
        PositiveTestResult(
          affectedChilds: affectedChilds,
          timestamp: Timestamp.now(),
        ),
      );
    }
  }
}
