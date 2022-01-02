import '/models/user.dart';

class Event {
  final int id;
  final User teacher;
  final List students;
  final String name;
  final String image;
  final String title;
  final String description;
  final String date;
  final bool avaliable;

  Event({
    required this.id,
    required this.teacher,
    required this.students,
    required this.name,
    required this.image,
    required this.title,
    required this.description,
    required this.date,
    required this.avaliable,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'teacher': teacher.toMap(),
  //     'students': students,
  //     'name': name,
  //     'image': image,
  //     'title': title,
  //     'description': description,
  //     'date': date,
  //     'avaliable': avaliable,
  //   };
  // }

  factory Event.fromJson(Map<String, dynamic> map) {
    return Event(
      id: map['id']?.toInt() ?? 0,
      teacher: User.fromJson(map['teacher']),
      students: List.from(map['students']),
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      avaliable: map['avaliable'] ?? false,
    );
  }
}
