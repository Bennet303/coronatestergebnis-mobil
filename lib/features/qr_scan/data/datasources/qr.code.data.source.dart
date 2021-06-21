import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';

abstract class QrCodeDataSource {
  Future<QrCode> tryGetQrCode(String scannedCode);
}
