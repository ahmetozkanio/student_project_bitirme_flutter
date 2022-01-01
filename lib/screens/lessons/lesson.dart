import 'package:flutter/material.dart';
import '/apis/attendance_api.dart';
import '/models/attendance.dart';
import '/models/lesson.dart';
import 'dart:convert';

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
            Container(
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
                                  Text("Katilanlar : " +
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
                                  lesson.description,
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
            ),
            Container(
              child: Expanded(
                child: Card(),
              ),
            ),
            Container(
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
              )

                  // ListView.builder(
                  //   itemCount: attendance.length,
                  //   itemBuilder: (context, position) {
                  //     return Card(
                  //         child: ListTile(
                  //       leading: FlutterLogo(),
                  //       title: Text(lesson.name),
                  //       subtitle: Text(lesson.name),
                  //       trailing: const Icon(
                  //         Icons.check_circle,
                  //         size: 30,
                  //         color: Colors.green,
                  //       ),
                  //     )

                  //         // onTap: () {
                  //         //   goToDetail(list[position]);
                  //         // },
                  //         );
                  // },
                  // ),
                  ),
            ),
            Container(
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
            ),
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
