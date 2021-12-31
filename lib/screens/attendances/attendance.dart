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
                  leading: const Icon(Icons.library_books_outlined),
                  title: Text(attendance.lesson.name),
                  subtitle: Text(attendance.date),
                )
              ],
            ),
          ),
          Table(
            children: [
              TableRow(
                children: [
                  Column(
                    children: [
                      Text(
                        "Tum Ogrenciler",
                      ),
                      Text(attendance.lesson.students.length.toString()),
                      // ListView.builder(
                      //   itemCount: attendance.user_joined.length,
                      //   itemBuilder: (context, position) {
                      //     return Card(
                      //       child: ListTile(
                      //         leading: attendance.user_joined[position].username
                      //             ? const Icon(
                      //                 Icons.access_time,
                      //                 size: 30,
                      //                 color: Colors.green,
                      //               )
                      //             : const Icon(
                      //                 Icons.access_time,
                      //                 size: 30,
                      //                 color: Colors.red,
                      //               ),
                      //         title: Text(attendance
                      //             .user_joined[position].user.first_name),
                      //         subtitle: Text(attendance
                      //             .user_joined[position].user.last_name),
                      //         trailing: Column(
                      //           children: [
                      //             Text(attendance.user_joined[position].email),
                      //           ],
                      //         ),
                      //         // onTap: () {
                      //         //   goToDetail(list[position]);
                      //         // },
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Katilan Ogrenciler",
                      ),
                      Text(attendance.user_joined.length.toString()),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
