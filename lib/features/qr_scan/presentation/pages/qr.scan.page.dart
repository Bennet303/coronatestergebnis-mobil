import 'package:coronatestergebnis_app/core/dependency.injector.dart';
import 'package:coronatestergebnis_app/features/qr_scan/presentation/bloc/qr_bloc/qr_scan_bloc.dart';
import 'package:coronatestergebnis_app/features/qr_scan/presentation/pages/join.class.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart'
    as BarcodeScanner;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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
        if (!kIsWeb) _scan(context);
        return Column(
          children: [
            BlocListener<QrScanBloc, QrScanState>(
              listener: (context, state) {
                if (state is QrScanSuccessful) {
                  if (isProcessing) Navigator.pop(context);
                  showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => JoinClassPage(qrCode: state.qrCode),
                    isDismissible: true,
                  );
                } else if (state is QrScanFailed) {
                  isProcessing = false;
                }
              },
              child: Container(),
            ),
            kIsWeb ? createInput(context) : Container(),
          ],
        );
      }),
    );
  }

  Widget createInput(BuildContext context) {
    return Column(children: [
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
    ]);
  }

  bool isProcessing = false;

  Future _scan(BuildContext context) async {
    String code = await BarcodeScanner.FlutterBarcodeScanner.scanBarcode(
        '#ff4caf50', "Abbrechen", false, BarcodeScanner.ScanMode.QR);
    BlocProvider.of<QrScanBloc>(context).add(ScanQrCode(code));
    // if (stream != null)
    //   stream.listen((barcode) {
    //     if (!isProcessing) isProcessing = true;

    //   });

    //return Container();
  }
}
