part of 'qr_scan_bloc.dart';

@immutable
abstract class QrScanState extends Equatable {}

class QrScanInitial extends QrScanState {
  @override
  List<Object?> get props => [];
}

class QrScanFailed extends QrScanState {
  @override
  List<Object?> get props => [];
}

class QrScanLoading extends QrScanState {
  @override
  List<Object?> get props => [];
}

class QrScanSuccessful extends QrScanState {
  final QrCode qrCode;

  QrScanSuccessful(this.qrCode);

  @override
  List<Object?> get props => [];
}
