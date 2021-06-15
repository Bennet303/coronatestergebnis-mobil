import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';

abstract class TestResult {}

class PositiveTestResult {
  List<Child> affectedChilds = [];

  PositiveTestResult(this.affectedChilds);
}

class NegativeTestResult {}
