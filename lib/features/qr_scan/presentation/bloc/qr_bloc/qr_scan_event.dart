part of 'qr_scan_bloc.dart';

@immutable
abstract class QrScanEvent {}

class ScanQrCode extends QrScanEvent {
  final String qrCode;

  ScanQrCode(this.qrCode);
}
