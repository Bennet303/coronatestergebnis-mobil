import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';

abstract class StudentsDataSource {
  Future<void> createStudent(String userID, Child child);
}
