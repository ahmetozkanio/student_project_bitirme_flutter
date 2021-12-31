import 'package:flutter/material.dart';
import '/models/attendance.dart';

class AttendanceDetail extends StatefulWidget {
  Attendance attendance;
  AttendanceDetail(this.attendance, {Key? key}) : super(key: key);

  @override
  _AttendanceDetailState createState() => _AttendanceDetailState(attendance);
}

class _AttendanceDetailState extends State<AttendanceDetail> {
  Attendance attendance;
  _AttendanceDetailState(this.attendance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${attendance.lesson.name} Detayi"),
      ),
      body: Center(
        child: Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.library_books_outlined),
                title: Text(attendance.lesson.name),
                subtitle: Text(attendance.date),
              )
            ],
          ),
        ),
      ),
    );
  }
}
