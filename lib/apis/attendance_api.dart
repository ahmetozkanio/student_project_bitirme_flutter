import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_project_bitirme_flutter/screens/attendances/attendance_actions/attendance_create.dart';
import 'api_base.dart';

class AttendanceApi with ApiBase {
  static Future getAttendance() {
    return http
        .get(Uri.parse(ApiBase.apiBaseUrl + "/api/attendances/?format=json"));
  }

  static Future<bool?> postAttendanceCreate(
      String date, String date2, int lesson) async {
    final url = Uri.parse(ApiBase.apiBaseUrl + '/api/attendances/');
    final headers = {"Content-Type": "application/json"};
    Map jsonMap = {"date": date, "date2": date2, "lesson": lesson};
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

  static Future<int?> putAttendanceUserAdd(
      int attendanceId, int student) async {
    final url =
        Uri.parse(ApiBase.apiBaseUrl + '/api/attendance/$attendanceId/join');
    final headers = {"Content-Type": "application/json"};
    List<int>? studentList = [student];

    Map jsonMap = {
      "user_joined": studentList,
    };
    String body = json.encode(jsonMap);
    print(jsonMap);
    final response = await http.put(url, headers: headers, body: body);

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    return response.statusCode;
  }
}
