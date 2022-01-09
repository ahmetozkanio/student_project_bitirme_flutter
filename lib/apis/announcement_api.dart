import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api_base.dart';

class AnnouncementApi {
  static Future getAnnouncement() {
    return http
        .get(Uri.parse(ApiBase.apiBaseUrl + "/api/announcements/?format=json"));
  }

  static Future<bool?> postAnnouncementCreate(
      String title, String description, int lesson) async {
    final url = Uri.parse(ApiBase.apiBaseUrl + '/api/announcements/');
    final headers = {"Content-Type": "application/json"};
    Map jsonMap = {
      "description": description,
      "title": title,
      "lesson": lesson
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
