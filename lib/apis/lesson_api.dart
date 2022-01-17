import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_base.dart';

class LessonApi with ApiBase {
  bool? responseValue;

  static Future getLesson() {
    return http
        .get(Uri.parse(ApiBase.apiBaseUrl + "/api/lessons/?format=json"));
  }

  static Future<bool?> postLessonCreate(
      String name, String description, int teacher) async {
    final url = Uri.parse(ApiBase.apiBaseUrl + '/api/lesson/add');
    final headers = {"Content-Type": "application/json"};
    Map jsonMap = {
      "name": name,
      "description": description,
      "teacher": teacher
    };
    String body = json.encode(jsonMap);
    print(jsonMap);
    final response = await http.post(url, headers: headers, body: body);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 201) {
      return Future<bool>.value(true);
    } else {
      if (response.statusCode == 400) {
        return Future<bool>.value(false);
      }
    }
  }

//     {
// "students":[1,5]
// }
  static Future<void> putLessonJoin(int lessonId, int student) async {
    final url = Uri.parse(ApiBase.apiBaseUrl + '/api/lesson/$lessonId');
    final headers = {"Content-Type": "application/json"};
    List<int>? studentList = [student];

    Map jsonMap = {
      "students": studentList,
    };
    String body = json.encode(jsonMap);
    print(jsonMap);
    final response = await http.put(url, headers: headers, body: body);

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    // if (response.statusCode == 201) {
    //   return Future<bool>.value(true);
    // } else {
    //   if (response.statusCode == 400) {
    //     return Future<bool>.value(false);
    //   }
    // }
  }
}
