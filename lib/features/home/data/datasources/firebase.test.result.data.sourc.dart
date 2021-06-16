import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronatestergebnis_app/features/home/data/datasources/test.result.data.source.dart';

class FirebaseTestResultDataSource extends TestResultDataSource {
  FirebaseFirestore store = FirebaseFirestore.instance;

  @override
  Future<bool> getTestResultForClass(String classID) async {
    final result = await store
        .collection('notifications')
        .where('classID', isEqualTo: classID)
        .get();

    return result.size != 0;
  }
}
