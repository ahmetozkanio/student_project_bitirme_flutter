import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/lesson_api.dart';
import 'package:student_project_bitirme_flutter/models/lesson.dart';
import 'package:student_project_bitirme_flutter/screens/attendances/attendance.dart';
import '/models/attendance.dart';
import 'dart:convert';
import '/apis/attendance_api.dart';
import '../lessons/lessons.dart';

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendanceList(),
    );
  }
}

class AttendanceList extends StatefulWidget {
  AttendanceList({Key? key}) : super(key: key);

  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  List<Attendance> list = <Attendance>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yoklamalar",
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) {
          return Card(
            child: ListTile(
              leading: list[position].avaliable
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
              title: Text(list[position].lesson.name),
              subtitle: Text(list[position].lesson.name),
              trailing: Column(
                children: [
                  Text(list[position].date),
                  Text(list[position].date2),
                ],
              ),
              onTap: () {
                goToDetail(list[position]);
              },
            ),
          );
        },
      ),
    );
  }

  getAttendance() {
    AttendanceApi.getAttendance().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.list =
            list.map((attendance) => Attendance.fromJson(attendance)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAttendance();
  }

  void goToDetail(Attendance attendance) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => AttendanceDetail(attendance)));
  }
}
