import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/repositories/join.class.repository.dart';
import 'package:dartz/dartz.dart';

class ScanCodeUsecase {
  final JoinClassRepository joinClassRepository;

  ScanCodeUsecase({required this.joinClassRepository});

  Future<Either<Failure, QrCode>> call(String qrID) async {
    return await joinClassRepository.tryGetQrCode(qrID);
  }
}
