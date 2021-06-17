import 'package:coronatestergebnis_app/features/qr_scan/presentation/pages/join.class.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart'
    as BarcodeScanner;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  int camera = 1;

  @override
  Widget build(BuildContext context) {
    //_scan();
    return ElevatedButton(
      onPressed: () {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => JoinClassPage(),
          isDismissible: true,
        );
      },
      child: Center(child: Text('scan')),
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
