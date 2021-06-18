import 'package:coronatestergebnis_app/core/error/failure.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';
import 'package:dartz/dartz.dart';

abstract class JoinClassRepository {
  Future<Either<Failure, void>> tryJoinClass(
      QrCode qrCode, String inputFirstname, String inputLastname);

  Future<Either<Failure, QrCode>> tryGetQrCode(String scannedCode);
}
