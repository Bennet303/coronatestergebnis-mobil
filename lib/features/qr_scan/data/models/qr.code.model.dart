import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';

class QrCodeModel extends QrCode {
  QrCodeModel(
      {required String classID,
      required String firstname,
      required String lastname})
      : super(classID, firstname, lastname);

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
      classID: json['classID']! as String,
      firstname: json['expectedFirstname']! as String,
      lastname: json['expectedLastname']! as String,
    );
  }
}
