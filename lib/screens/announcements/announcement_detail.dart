import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:student_project_bitirme_flutter/models/announcement.dart';
import '/models/event.dart';

class AnnouncementDetail extends StatefulWidget {
  Announcement announcement;
  AnnouncementDetail(this.announcement, {Key? key}) : super(key: key);

  @override
  _AnnouncementDetailState createState() =>
      _AnnouncementDetailState(announcement);
}

class _AnnouncementDetailState extends State<AnnouncementDetail> {
  Announcement announcement;
  _AnnouncementDetailState(this.announcement);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${announcement.title} Detayi"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.announcement),
                text: "Duyuru",
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
                              title: Text(announcement.lesson.name),
                              subtitle: Text(announcement.date),
                            ),
                          ),
                          Column(
                            children: [
                              Card(
                                child: Text(
                                  announcement.title,
                                ),
                              ),
                              Card(
                                child: Html(data: announcement.description),
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
          ],
        ),
      ),
    );
  }
}
