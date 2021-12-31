import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/models/lesson.dart';

class LessonDetail extends StatefulWidget {
  Lesson lesson;
  LessonDetail(this.lesson, {Key? key}) : super(key: key);

  @override
  _LessonDetailState createState() => _LessonDetailState(lesson);
}

class _LessonDetailState extends State<LessonDetail> {
  Lesson lesson;
  _LessonDetailState(this.lesson);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${lesson.name} Detayi"),
      ),
      body: Center(
        child: Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.library_books_outlined),
                title: Text(lesson.name),
                subtitle: Text(lesson.description),
              )
            ],
          ),
        ),
      ),
    );
  }
}
