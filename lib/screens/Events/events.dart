import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/api_base.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';
import '/apis/event_api.dart';
import '/models/event.dart';
import 'dart:convert';

import 'event.dart';
import 'event_actions/event_create.dart'; //json.

class EventApp extends StatefulWidget {
  EventApp({Key? key}) : super(key: key);

  @override
  _EventAppState createState() => _EventAppState();
}

enum Choice { Create }

class _EventAppState extends State<EventApp> {
  List<Event> eventList = <Event>[];
  bool? userTeacher;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Etkinlikler",
        ),
        actions: [
          if (userTeacher == true)
            PopupMenuButton<Choice>(
                onSelected: (Choice choice) {
                  select(choice);
                },
                itemBuilder: (context) => <PopupMenuEntry<Choice>>[
                      PopupMenuItem<Choice>(
                        value: Choice.Create,
                        child: Text("Yeni Etkinlik Olustur"),
                      )
                    ])
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(eventList.length, (position) {
          return InkWell(
            onTap: () {
              goToDetail(eventList[position]);
            },
            child: Container(
              child: Column(
                children: [
                  Card(
                    color: Colors.blue,
                    child: Image.network(
                        ApiBase.apiBaseUrl + eventList[position].image),
                  ),
                  ListTile(
                    title: Text(eventList[position].name),
                    subtitle: Text(eventList[position].date),
                    trailing: const Icon(
                      Icons.event_available,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  getEvent() {
    EventApi.getEvent().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        eventList = list.map((event) => Event.fromJson(event)).toList();
      });
    });
  }

  getUserTeacher() async {
    AuthenticationManager authManager = AuthenticationManager(context: context);
    Future<bool?> isStaff = authManager.fetchUserIsStaff();
    userTeacher = await isStaff;
  }

  @override
  void initState() {
    getEvent();
    getUserTeacher();
    super.initState();
  }

  void goToDetail(Event event) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EventDetail(event)));
  }

  void select(Choice choice) async {
    switch (choice) {
      case Choice.Create:
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => EventCreate()));

        break;
    }
  }
}
