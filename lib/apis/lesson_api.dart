import 'package:http/http.dart' as http;
import 'api_base.dart';

class LessonApi with ApiBase {
  static Future getLesson() {
    return http
        .get(Uri.parse(ApiBase.apiBaseUrl + "/api/lessons/?format=json"));
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
