// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../models/lesson.dart';

// class EventProvider with ChangeNotifier {
//   EventProvider() {
//     fechTasks();
//   }
//   List<Event> _lessons = [];

//   List<Event> get lessons {
//     return [..._lessons];
//   }

//   fechTasks() async {
//     const url = "http://10.0.3.2:8000/api/lessons/?format=json";
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body) as List;
//       _lessons = data.map((json) => Lesson.fromJson(json)).toList();
//     }
//   }
// }
