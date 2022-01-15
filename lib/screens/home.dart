import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/announcement_api.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/login/login.dart';
import 'package:student_project_bitirme_flutter/screens/announcements/announcements.dart';
import 'package:student_project_bitirme_flutter/screens/lessons/my_lessons.dart';

import '/models/attendance.dart';
import '/screens/Events/events.dart';
import '/screens/attendances/attendances.dart';
import 'lessons/lessons.dart';
import 'user_profile/user_profile.dart';

class HomeApp extends StatefulWidget {
  HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  // List<String> homeItems = [
  //   "Derslerim",
  //   "Tum Dersler",
  //   "Yoklamalar",
  //   "Etkinlikler",
  //   "Duyurular",
  //   "Profilim"
  // ];
  int? userId;

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = AuthenticationManager(context: context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => {gotToProfile()},
          child: Icon(
            Icons.account_circle,
            size: 32,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Ana Sayfa  ",
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                authManager.fetchUserLogout();
              });
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyLessonsList()));
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purple),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.school,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Derslerim",
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
                    Icons.architecture,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Tum Dersler",
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
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnnouncementApp()));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.yellow),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.announcement,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Duyurular",
                    style: TextStyle(
                      color: Colors.black,
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

  getUserId() async {
    AuthenticationManager authManager = AuthenticationManager(context: context);
    Future<int?> id = authManager.fetchUserId();
    userId = await id;
    print(userId);
  }

  void gotToProfile() async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => UserProfile(id: userId)));
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }
}
