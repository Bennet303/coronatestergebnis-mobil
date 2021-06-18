import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/datasources/qr.code.data.source.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/models/qr.code.model.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';

class FirebaseQrCodeDataSource extends QrCodeDataSource {
  FirebaseFirestore store = FirebaseFirestore.instance;

  @override
  Future<QrCode> tryGetQrCode(String scannedCode) async {
    final qrCode = await store.collection('qr').doc(scannedCode).get();
    if (!qrCode.exists) {
      throw Exception('Invalid QR Code');
    }

    return QrCodeModel.fromJson(qrCode.data()!);
  }
}
