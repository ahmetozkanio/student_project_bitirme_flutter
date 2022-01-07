import 'package:flutter/material.dart';
import '/../models/lesson.dart';

class LessonTabPage extends StatelessWidget {
  LessonTabPage(this.lesson, {Key? key}) : super(key: key);
  Lesson lesson;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Card(
                    shadowColor: Colors.green,
                    child: ListTile(
                      title: Text(lesson.name),
                      subtitle: Text(lesson.name),
                      trailing: Column(
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("Ogrenci Sayisi : " +
                              lesson.students.length.toString()),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Card(
                        child: Text(
                          lesson.name,
                        ),
                      ),
                      Card(
                        child: Text(
                          lesson.description ?? '',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
