import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/announcement_api.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';
import 'package:student_project_bitirme_flutter/models/announcement.dart';

import 'dart:convert';

import 'announcement_actions/announcement_create.dart';
import 'announcement_detail.dart';

class AnnouncementApp extends StatefulWidget {
  AnnouncementApp({Key? key}) : super(key: key);

  @override
  _AnnouncementAppState createState() => _AnnouncementAppState();
}

class _AnnouncementAppState extends State<AnnouncementApp> {
  List<Announcement> announList = <Announcement>[];
  int? userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yoklamalar",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var list in announList)
              for (var userList in list.lesson.students)
                if (userList == userId)
                  Card(
                    child: ListTile(
                      leading: list.avaliable
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
                      title: Text(list.title),
                      subtitle: Text(list.lesson.name),
                      trailing: Column(
                        children: [
                          Text(list.date),
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
    );
  }

  getAnnouncement() {
    AnnouncementApi.getAnnouncement().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        announList = list
            .map((announcement) => Announcement.fromJson(announcement))
            .toList();
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
    getAnnouncement();
    super.initState();
  }

  void goToDetail(Announcement announcement) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AnnouncementDetail(announcement)));
  }
}
