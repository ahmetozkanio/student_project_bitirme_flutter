import 'dart:math';

import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';

import 'package:student_project_bitirme_flutter/screens/lessons/lesson.dart';
import 'package:student_project_bitirme_flutter/screens/lessons/lesson_actions/lesson_create.dart';
import 'dart:convert';
import '../../models/lesson.dart';
import '../../apis/lesson_api.dart';

class MyLessonsList extends StatefulWidget {
  const MyLessonsList({Key? key}) : super(key: key);

  @override
  _MyLessonsListState createState() => _MyLessonsListState();
}

enum Choice { Create, Delete }

class _MyLessonsListState extends State<MyLessonsList> {
  List<Lesson> lessonList = <Lesson>[];

  bool? userTeacher;
  int? userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Derslerim",
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
      body: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        crossAxisCount: 3,
        children: [
          for (var list in lessonList)
            for (int i = 0; i < list.students.length; i++)
              if (list.students[i]['id'] == userId)
                InkWell(
                  onTap: () {
                    goToDetail(list);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.school,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          list.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
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

  getUserId() async {
    AuthenticationManager authManager = AuthenticationManager(context: context);
    Future<int?> id = authManager.fetchUserId();
    userId = await id;
  }

  @override
  void initState() {
    getLesson();
    getUserTeacher();
    getUserId();
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
