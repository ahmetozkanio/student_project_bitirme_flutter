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
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(attendance.lesson.name),
                  subtitle: Text(attendance.date + " - " + attendance.date2),
                  trailing: Column(
                    children: [
                      Text("Ogrenciler : " +
                          attendance.lesson.students.length.toString()),
                      Text("Katilanlar : " +
                          attendance.user_joined.length.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: attendance.user_joined.length,
              itemBuilder: (context, position) {
                return Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text(attendance.user_joined[position]["username"]),
                    subtitle: Text(attendance.user_joined[position]
                            ["first_name"] +
                        " " +
                        attendance.user_joined[position]["last_name"]),
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
        ],
      ),
    );
  }
}
