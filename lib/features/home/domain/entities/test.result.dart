import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';

abstract class TestResult {}

class PositiveTestResult extends TestResult {
  List<Child> affectedChilds = [];
  Timestamp timestamp;

  PositiveTestResult({required this.affectedChilds, required this.timestamp});
}

class NegativeTestResult extends TestResult {}
