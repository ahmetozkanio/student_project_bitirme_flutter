import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/announcement_api.dart';
import 'package:student_project_bitirme_flutter/models/announcement.dart';
import 'package:student_project_bitirme_flutter/models/lesson.dart';

import 'dart:convert';

class LessonTabAnnouncementList extends StatefulWidget {
  LessonTabAnnouncementList({this.lesson, Key? key}) : super(key: key);
  Lesson? lesson;

  @override
  _LessonTabAnnouncementState createState() =>
      _LessonTabAnnouncementState(lesson);
}

class _LessonTabAnnouncementState extends State<LessonTabAnnouncementList> {
  _LessonTabAnnouncementState(this.lesson);
  Lesson? lesson;
  List<Announcement> announcementList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: Column(
        children: [
          for (var item in announcementList)
            if (item.lesson.id == lesson!.id)
              Card(
                child: ListTile(
                  leading: item.avaliable
                      ? const Icon(
                          Icons.announcement,
                          size: 30,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.access_time,
                          size: 30,
                          color: Colors.red,
                        ),
                  title: Text(
                    item.title,
                  ),
                  subtitle: Text(item.date),
                ),
              )
        ],
      )),
    );
  }

  getAnnouncement() {
    AnnouncementApi.getAnnouncement().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        announcementList = list
            .map((announcement) => Announcement.fromJson(announcement))
            .toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAnnouncement();
  }

  // void goToDetail(Attendance attendance) async {
  //   await Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => AttendanceDetail(attendance)));
  // }
}
