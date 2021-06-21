import 'package:coronatestergebnis_app/core/dependency.injector.dart';
import 'package:coronatestergebnis_app/features/qr_scan/presentation/bloc/qr_bloc/qr_scan_bloc.dart';
import 'package:coronatestergebnis_app/features/qr_scan/presentation/pages/join.class.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart'
    as BarcodeScanner;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  int camera = 1;
  TextEditingController qrCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //_scan();
    return BlocProvider<QrScanBloc>.value(
      value: injector<QrScanBloc>(),
      child: Builder(builder: (context) {
        return Column(
          children: [
            BlocListener<QrScanBloc, QrScanState>(
              listener: (context, state) {
                if (state is QrScanSuccessful) {
                  showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => JoinClassPage(qrCode: state.qrCode),
                    isDismissible: true,
                  );
                }
              },
              child: Container(),
            ),
            TextField(
              controller: qrCodeController,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<QrScanBloc>(context)
                    .add(ScanQrCode(qrCodeController.value.text));
              },
              child: Center(child: Text('scan')),
            ),
          ],
        );
      }),
    );
  }

  Future<void> _scan() async {
    final stream =
        BarcodeScanner.FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff4caf50', "Abbrechen", false, BarcodeScanner.ScanMode.QR);
    if (stream != null)
      stream.listen((barcode) {
        print(barcode);
      });
  }
}
