import 'package:flutter/material.dart';

import '/models/lesson.dart';

class LessonTabStudentsPage extends StatelessWidget {
  LessonTabStudentsPage(this.lesson, {Key? key}) : super(key: key);
  Lesson lesson;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: lesson.students.length,
          itemBuilder: (context, position) {
            return Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text(lesson.students[position]["username"]),
                subtitle: Text(lesson.students[position]["first_name"] +
                    " " +
                    lesson.students[position]["last_name"]),
                trailing: const Icon(
                  Icons.check_circle,
                  size: 30,
                  color: Colors.green,
                ),
              ),

              // onTap: () {
              //   goToDetail(list[position]);
              // },
            );
          },
        ),
      ),
    );
  }
}
