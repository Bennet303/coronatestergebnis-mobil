import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/usecases/scan.code.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'qr_scan_event.dart';
part 'qr_scan_state.dart';

class QrScanBloc extends Bloc<QrScanEvent, QrScanState> {
  final ScanCodeUsecase scanCodeUsecase;

  QrScanBloc(this.scanCodeUsecase) : super(QrScanInitial());
  @override
  Stream<QrScanState> mapEventToState(
    QrScanEvent event,
  ) async* {
    if (event is ScanQrCode) {
      yield QrScanLoading();
      final failureOrQR = await scanCodeUsecase(event.qrCode.trim());
      yield failureOrQR.fold(
          (failure) => QrScanFailed(), (qr) => QrScanSuccessful(qr));
    }
  }
}
