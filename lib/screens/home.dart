import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/models/login_model/shared_service.dart';
import '/models/attendance.dart';
import '/screens/Events/events.dart';
import '/screens/attendances/attendances.dart';
import 'lessons/lessons.dart';

class HomeApp extends StatefulWidget {
  HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List<String> homeItems = [
    "Dersler",
    "Yoklamalar",
    "Etkinlikler",
    "Duyurular",
    "Profilim"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ana Sayfa  ",
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              SharedServise.logout(context);
            },
            icon: Icon(Icons.logout),
            color: Colors.black,
          )
        ],
      ),
      body: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LessonApp()));
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.red),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.play_lesson_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Dersler",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AttendanceApp()));
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.green),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.play_lesson_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Yoklamalar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EventApp()));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.play_lesson_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Etkinlikler",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
