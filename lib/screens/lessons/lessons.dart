import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';

import 'package:student_project_bitirme_flutter/screens/lessons/lesson.dart';
import 'package:student_project_bitirme_flutter/screens/lessons/lesson_actions/lesson_create.dart';
import 'dart:convert';
import '../../models/lesson.dart';
import '../../apis/lesson_api.dart';

class LessonApp extends StatelessWidget {
  const LessonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LessonsList(),
    );
  }
}

class LessonsList extends StatefulWidget {
  const LessonsList({Key? key}) : super(key: key);

  @override
  _LessonsListState createState() => _LessonsListState();
}

enum Choice { Create, Delete }

class _LessonsListState extends State<LessonsList> {
  List<Lesson> lessonList = <Lesson>[];

  bool? userTeacher;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Dersler",
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
                          child: Text("Yeni Ders Ekle"),
                        )
                      ])
          ]),
      body: ListView.builder(
          itemCount: lessonList.length,
          itemBuilder: (context, position) {
            return Card(
              child: ListTile(
                leading: const FlutterLogo(),
                title: Text(lessonList[position].name),
                subtitle: Text(lessonList[position].description ?? ''),
                onTap: () {
                  goToDetail(lessonList[position]);
                },
              ),
            );
          }),
    );
  }

  getLesson() {
    LessonApi.getLesson().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        lessonList = list.map((lesson) => Lesson.fromJson(lesson)).toList();
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
    getLesson();
    getUserTeacher();
    super.initState();
  }

  void goToDetail(Lesson lesson) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LessonDetail(lesson, userTeacher!)));
  }

  void select(Choice choice) async {
    switch (choice) {
      case Choice.Create:
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => LessonCreate()));

        break;
      case Choice.Delete:
        // TODO: Handle this case.
        break;
    }
  }
}
