import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/attendance_api.dart';

import '/models/attendance.dart';
import '/models/lesson.dart';

class LessonTabAttendancePage extends StatefulWidget {
  LessonTabAttendancePage(this.lesson, {Key? key}) : super(key: key);

  Lesson lesson;

  @override
  State<LessonTabAttendancePage> createState() =>
      _LessonTabAttendancePageState();
}

class _LessonTabAttendancePageState extends State<LessonTabAttendancePage> {
  List<Attendance> attendance = <Attendance>[];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Expanded(
            child: Column(
          children: [
            for (var item in attendance)
              if (item.lesson.id == widget.lesson.id)
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
      ),
    );
  }

  getAttendance() {
    AttendanceApi.getAttendance().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        attendance =
            list.map((attendance) => Attendance.fromJson(attendance)).toList();
      });
    });
  }

  @override
  void initState() {
    getAttendance();
    super.initState();
  }
}
