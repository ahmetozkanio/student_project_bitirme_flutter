import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/announcement_api.dart';
import 'package:student_project_bitirme_flutter/models/announcement.dart';

import 'dart:convert';

import 'announcement_actions/announcement_create.dart';
import 'announcement_detail.dart';

class AnnouncementApp extends StatelessWidget {
  const AnnouncementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnnouncementList(),
    );
  }
}

class AnnouncementList extends StatefulWidget {
  AnnouncementList({Key? key}) : super(key: key);

  @override
  _AnnouncementListState createState() => _AnnouncementListState();
}

class _AnnouncementListState extends State<AnnouncementList> {
  List<Announcement> list = <Announcement>[];

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
                      Icons.announcement,
                      size: 30,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.access_time,
                      size: 30,
                      color: Colors.red,
                    ),
              title: Text(list[position].title),
              subtitle: Text(list[position].lesson.name),
              trailing: Column(
                children: [
                  Text(list[position].date),
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

  getAnnouncement() {
    AnnouncementApi.getAnnouncement().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.list = list
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

  void goToDetail(Announcement announcement) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AnnouncementDetail(announcement)));
  }
}
