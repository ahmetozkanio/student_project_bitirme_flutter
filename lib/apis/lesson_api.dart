import 'package:http/http.dart' as http;

class LessonApi {
  static Future getLesson() {
    return http.get(Uri.parse("http://10.0.3.2:8000/api/lessons/?format=json"));
  }
}

// class LessonProvider with ChangeNotifier {
//   LessonProvider() {
//     fechTasks();
//   }
//   List<Lesson> _lessons = [];

//   List<Lesson> get lessons {
//     return [..._lessons];
//   }

//   fechTasks() async {
//     const url = ;
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body) as List;
//       _lessons = data.map((json) => Lesson.fromJson(json)).toList();
//     }
//   }
// }
