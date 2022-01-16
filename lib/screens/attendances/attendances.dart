import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';

import 'package:student_project_bitirme_flutter/screens/attendances/attendance.dart';
import 'package:student_project_bitirme_flutter/screens/attendances/attendance_actions/qr_scan_page.dart';
import '/models/attendance.dart';
import 'dart:convert';
import '/apis/attendance_api.dart';

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
  List<Attendance> attendanceList = <Attendance>[];
  int? userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yoklamalar",
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                for (var list in attendanceList)
                  for (var userList in list.lesson.students)
                    if (userList["id"] == userId)
                      Card(
                        child: ListTile(
                          leading: list.avaliable
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
                          title: Text(list.lesson.name),
                          subtitle: Text(list.lesson.name),
                          trailing: Column(
                            children: [
                              for (var userJoinList in list.user_joined)
                                if (userJoinList["id"] == userId)
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 30, left: 30),
                                    color: Colors.green,
                                    child: Text(
                                      "Katildin",
                                      style: TextStyle(
                                          backgroundColor: Colors.green,
                                          color: Colors.white),
                                    ),
                                  ),
                              Text(list.date),
                              Text(list.date2),
                            ],
                          ),
                          onTap: () {
                            goToDetail(list);
                          },
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {
          goToQrScan();
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  getAttendance() {
    AttendanceApi.getAttendance().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        attendanceList =
            list.map((attendance) => Attendance.fromJson(attendance)).toList();
      });
    });
  }

  getUserId() async {
    AuthenticationManager authManager = AuthenticationManager(context: context);
    Future<int?> id = authManager.fetchUserId();
    userId = await id;
  }

  @override
  void initState() {
    getUserId();
    getAttendance();

    super.initState();
  }

  void goToDetail(Attendance attendance) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => AttendanceDetail(attendance)));
  }

  void goToQrScan() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => QrScanPage()));
  }
}
