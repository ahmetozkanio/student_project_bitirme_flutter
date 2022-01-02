import 'package:flutter/material.dart';

import '/models/attendance.dart';
import '/models/lesson.dart';

class LessonTabAttendancePage extends StatelessWidget {
  LessonTabAttendancePage(this.lesson, this.attendance, {Key? key})
      : super(key: key);
  List<Attendance> attendance;
  Lesson lesson;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: Column(
        children: [
          for (var item in attendance)
            if (item.lesson.id == lesson.id)
              Card(
                child: ListTile(
                  leading: item.avaliable
                      ? const Icon(
                          Icons.access_time,
                          size: 30,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.access_time,
                          size: 30,
                          color: Colors.red,
                        ),
                  title: Text(
                    item.date,
                  ),
                  subtitle: Text(item.lesson.name),
                  trailing: Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Toplam Ogrenciler : " +
                            item.lesson.students.length.toString(),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Katilan Ogrenciler : " +
                            item.user_joined.length.toString(),
                      ),
                    ],
                  ),
                ),
              )
        ],
      )),
    );
  }
}
