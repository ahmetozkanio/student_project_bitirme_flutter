import 'dart:convert';

import 'package:student_project_bitirme_flutter/models/lesson.dart';
import 'package:student_project_bitirme_flutter/models/user.dart';

class Attendance {
  final int id;
  final String date;
  final String date2;
  final bool avaliable;

  final Lesson lesson;
  final User user_joined;

  Attendance({
    required this.id,
    required this.date,
    required this.date2,
    required this.avaliable,
    required this.lesson,
    required this.user_joined,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'date': date,
  //     'date2': date2,
  //     'avaliable': avaliable,
  //     'lesson': lesson,
  //     'user_joined': user_joined,
  //   };
  // }

  factory Attendance.fromJson(Map<String, dynamic> map) {
    return Attendance(
      id: map['id']?.toInt() ?? 0,
      date: map['date'] ?? '',
      date2: map['date2'] ?? '',
      avaliable: map['avaliable'] ?? false,
      lesson: Lesson.fromJson(map['lesson']),
      user_joined: User.fromJson(map['user_joined']),
    );
  }
}
