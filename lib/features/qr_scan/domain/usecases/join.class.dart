import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/repositories/join.class.repository.dart';
import 'package:dartz/dartz.dart';

class JoinClassUsecase {
  final JoinClassRepository joinClassRepository;

  JoinClassUsecase({required this.joinClassRepository});
  Future<Either<Failure, void>> call(
      {required QrCode qrCode,
      required String inputFirstname,
      required String inputLastname}) async {
    return await joinClassRepository.tryJoinClass(
        qrCode, inputFirstname, inputLastname);
  }
}
