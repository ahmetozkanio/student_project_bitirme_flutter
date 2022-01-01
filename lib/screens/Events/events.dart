import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/api_base.dart';
import '/apis/event_api.dart';
import '/models/event.dart';
import 'dart:convert';

import 'event.dart'; //json.

class EventApp extends StatelessWidget {
  const EventApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventList(),
    );
  }
}

class EventList extends StatefulWidget {
  EventList({Key? key}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<Event> eventList = <Event>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Etkinlikler",
        ),
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

  @override
  void initState() {
    getEvent();
    super.initState();
  }

  void goToDetail(Event event) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EventDetail(event)));
  }
}
