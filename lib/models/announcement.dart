import 'dart:convert';

import 'package:student_project_bitirme_flutter/models/lesson.dart';

class Announcement {
  final Lesson lesson;
  final String title;
  final String description;
  final String date;
  final bool avaliable;
  Announcement({
    required this.lesson,
    required this.title,
    required this.description,
    required this.date,
    required this.avaliable,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'lesson': lesson.toJson(),
  //     'title': title,
  //     'description': description,
  //     'date': date,
  //     'avaliable': avaliable,
  //   };
  // }

  factory Announcement.fromJson(Map<String, dynamic> map) {
    return Announcement(
      lesson: Lesson.fromJson(map['lesson']),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      avaliable: map['avaliable'] ?? false,
    );
  }

  // String toJson() => json.encode(toMap());

}
