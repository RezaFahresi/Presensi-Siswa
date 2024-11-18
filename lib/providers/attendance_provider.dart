import 'package:flutter/material.dart';
import 'package:projectbaru/models/attendance_record.dart';
import '../models/student.dart';


class AttendanceProvider with ChangeNotifier {
  final List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
    Student(name: 'Reza'),
  ];

  final List<AttendanceRecord> _attendanceHistory = [];
  List<Student> get students => _students;
  List<AttendanceRecord> get attedanceHistory =>
      _attendanceHistory.reversed.toList();

  void saveAttedance() {
    final presentCount = _students.where((student) => student.isPresent).length;
    final absentCount = _students.length - presentCount;

    _attendanceHistory.add(AttendanceRecord(
      date: DateTime.now(),
      presentCount: presentCount,
      absentCount: absentCount,
    ));

    for (var student in _students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}