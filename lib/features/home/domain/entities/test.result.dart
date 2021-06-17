import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';

abstract class TestResult {
  final Timestamp timestamp;

  TestResult(this.timestamp);
}

class PositiveTestResult extends TestResult {
  List<Child> affectedChilds = [];

  PositiveTestResult({required this.affectedChilds, Timestamp? timestamp})
      : super(timestamp ?? Timestamp.now());
}

class NegativeTestResult extends TestResult {
  NegativeTestResult(Timestamp? timestamp)
      : super(timestamp ?? Timestamp.now());
}
