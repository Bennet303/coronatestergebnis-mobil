import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/datasources/students.data.source.dart';

class FirebaseStudentsDataSource extends StudentsDataSource {
  FirebaseFirestore store = FirebaseFirestore.instance;

  @override
  Future<void> createStudent(String userID, Child child) async {
    await store.collection('student').doc().set({
      'classID': child.classID,
      'firstname': child.firstname,
      'lastname': child.lastname,
      'userID': userID,
    });
  }
}
