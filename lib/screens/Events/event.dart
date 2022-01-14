import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '/models/event.dart';

class EventDetail extends StatefulWidget {
  Event event;
  EventDetail(this.event, {Key? key}) : super(key: key);

  @override
  _EventDetailState createState() => _EventDetailState(event);
}

class _EventDetailState extends State<EventDetail> {
  Event event;
  _EventDetailState(this.event);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${event.name} Detayi"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.event),
                text: "Etkinlik",
              ),
              Tab(
                icon: Icon(Icons.person),
                text: "Katilanlar",
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
                              title: Text(event.name),
                              subtitle: Text(event.date),
                              trailing: Column(
                                children: [
                                  Text("Katilanlar : " +
                                      event.students.length.toString()),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Card(
                                child: Text(
                                  event.title,
                                ),
                              ),
                              Card(
                                child: Html(data: event.description),
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
                child: ListView.builder(
                  itemCount: event.students.length,
                  itemBuilder: (context, position) {
                    return Card(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text(event.students[position]["username"]),
                        subtitle: Text(event.students[position]["first_name"] +
                            " " +
                            event.students[position]["last_name"]),
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
}
