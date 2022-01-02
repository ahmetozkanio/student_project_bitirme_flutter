import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/message_api.dart';
import 'package:student_project_bitirme_flutter/models/message.dart';
import 'package:student_project_bitirme_flutter/screens/lessons/lesson_detail/lesson_tab_message.dart';
import '/screens/lessons/lesson_detail/lesson_tab_students.dart';
import '/screens/lessons/lesson_detail/lesson_tab_attendance.dart';
import '/apis/attendance_api.dart';
import '/models/attendance.dart';
import '/models/lesson.dart';
import 'dart:convert';

import 'lesson_detail/lesson_tab_page.dart';

class LessonDetail extends StatefulWidget {
  Lesson lesson;
  LessonDetail(this.lesson, {Key? key}) : super(key: key);

  @override
  _LessonDetailState createState() => _LessonDetailState(lesson);
}

class _LessonDetailState extends State<LessonDetail> {
  Lesson lesson;
  _LessonDetailState(this.lesson);
  List<Attendance> attendance = <Attendance>[];

  /////

  //////
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${lesson.name} Detayi"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.school),
                text: "Ders",
              ),
              Tab(
                icon: Icon(Icons.message),
                text: "Mesajlar",
              ),
              Tab(
                icon: Icon(Icons.lock_clock),
                text: "Yoklamalar",
              ),
              Tab(
                icon: Icon(Icons.person),
                text: "Ogrenciler",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            LessonTabPage(lesson),
            LessonTabMessagePage(lesson.id),
            LessonTabAttendancePage(lesson, attendance),
            LessonTabStudentsPage(lesson),
          ],
        ),
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
    super.initState();

    getAttendance();
  }
}
