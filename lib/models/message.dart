import 'package:student_project_bitirme_flutter/models/user.dart';

class Message {
  final int id;
  final String text;
  final String date;
  final bool avaliable;
  final int lesson;
  final User user;
  Message({
    required this.id,
    required this.text,
    required this.date,
    required this.avaliable,
    required this.lesson,
    required this.user,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'text': text,
  //     'date': date,
  //     'avaliable': avaliable,
  //     'lesson': lesson,
  //     'user': user,
  //   };
  // }

  factory Message.fromJson(Map<String, dynamic> map) {
    return Message(
      id: map['id']?.toInt() ?? 0,
      text: map['text'] ?? '',
      date: map['date'] ?? '',
      avaliable: map['avaliable'] ?? false,
      lesson: map['lesson']?.toInt() ?? 0,
      user: User.fromJson(map['user']),
    );
  }
}
