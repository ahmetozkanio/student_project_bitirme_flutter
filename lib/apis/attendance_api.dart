import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
