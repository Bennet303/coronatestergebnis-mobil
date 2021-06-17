import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'qr_scan_event.dart';
part 'qr_scan_state.dart';
class QrScanBloc extends Bloc<QrScanEvent, QrScanState> {
  QrScanBloc() : super(QrScanInitial());
  @override
  Stream<QrScanState> mapEventToState(
    QrScanEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
