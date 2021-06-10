import '../entities/credentials.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> login(Credentials credentials);
}
