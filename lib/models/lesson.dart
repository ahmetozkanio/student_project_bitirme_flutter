class Lesson {
  final int id;
  final int teacher;
  final String name;
  final String? description;
  final bool avaliable;
  final List students;

  Lesson(
      {required this.id,
      required this.teacher,
      required this.name,
      required this.description,
      required this.avaliable,
      required this.students});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
        id: json["id"],
        teacher: json["teacher"],
        name: json["name"],
        description: json["description"],
        avaliable: json["avaliable"],
        students: json["students"]);
  }
}
