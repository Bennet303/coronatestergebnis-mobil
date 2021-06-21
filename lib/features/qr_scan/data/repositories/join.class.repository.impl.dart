import 'package:coronatestergebnis_app/features/authentication/domain/repositories/login.repository.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/datasources/qr.code.data.source.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/datasources/students.data.source.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';
import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/repositories/join.class.repository.dart';
import 'package:dartz/dartz.dart';

class JoinClassRepositoryImpl extends JoinClassRepository {
  final QrCodeDataSource qrDataSource;
  final StudentsDataSource studentsDataSource;
  final LoginRepository loginRepository;

  JoinClassRepositoryImpl(
      {required this.loginRepository,
      required this.studentsDataSource,
      required this.qrDataSource});

  @override
  Future<Either<Failure, QrCode>> tryGetQrCode(String scannedCode) async {
    try {
      QrCode qrCode = await qrDataSource.tryGetQrCode(scannedCode);
      return Right(qrCode);
    } catch (e) {
      return Left(InvalidQrCodeFailure());
    }
  }

  @override
  Future<Either<Failure, void>> tryJoinClass(
      QrCode qrCode, String inputFirstname, String inputLastname) async {
    try {
      final failureOrUser = await loginRepository.getCurrentUser();

      if (failureOrUser.isLeft()) throw Exception('No user is signed in');

      if (qrCode.firstname != inputFirstname ||
          qrCode.lastname != inputLastname)
        throw Exception(
          'Student to be added doesnt match student the code was created for.',
        );

      final user = failureOrUser.getOrElse(() => throw Error());
      final child = Child(
        id: '',
        classID: qrCode.classID,
        firstname: inputFirstname,
        lastname: inputLastname,
      );
      return Right(await studentsDataSource.createStudent(user.email, child));
    } catch (e) {
      return Left(JoiningClassFailure('Failed to join a class'));
    }
  }
}

class JoiningClassFailure extends Failure {
  JoiningClassFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class InvalidQrCodeFailure extends Failure {
  InvalidQrCodeFailure() : super('Ungültiger QR Code!');

  @override
  List<Object?> get props => [message];
}
