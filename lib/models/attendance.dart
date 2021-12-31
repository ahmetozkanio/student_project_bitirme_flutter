import 'dart:convert';

import '/models/lesson.dart';
import '/models/user.dart';

class Attendance {
  final int id;
  final String date;
  final String date2;
  final bool avaliable;

  final Lesson lesson;
  final List user_joined;

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
  //     'lesson': lesson.toMap(),
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
      user_joined: List.from(map['user_joined']),
    );
  }
}
