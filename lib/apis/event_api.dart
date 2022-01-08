import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api_base.dart';

class EventApi with ApiBase {
  static Future getEvent() {
    return http.get(Uri.parse(ApiBase.apiBaseUrl + "/api/events/?format=json"));
  }

  static Future<bool?> postEventCreate(
      String name, String description, String title, int teacher) async {
    final url = Uri.parse(ApiBase.apiBaseUrl + '/api/events/');
    final headers = {"Content-Type": "application/json"};
    Map jsonMap = {
      "name": name,
      "description": description,
      "title": title,
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
}
