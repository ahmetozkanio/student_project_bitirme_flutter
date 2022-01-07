import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:student_project_bitirme_flutter/models/message.dart';
import 'api_base.dart';

class MessageApi with ApiBase {
  static Future getMessage(int lessonId) {
    return http.get(Uri.parse(ApiBase.apiBaseUrl +
        "/api/lesson/" +
        "$lessonId" +
        "/messages" +
        "/?format=json"));
  }

  static Future<void> postMessage(String text, int lesson, int user) async {
    final url = Uri.parse(ApiBase.apiBaseUrl + '/api/messages/');
    final headers = {"Content-Type": "application/json"};
    Map jsonMap = {"lesson": lesson, "user": user, "text": text};

    String body = json.encode(jsonMap);
    print(jsonMap);

    final response = await http.post(url, headers: headers, body: body);

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }
  // static Future<Message> postMessage(String text, int lesson, int user) async {
  //   final response = await http.post(
  //     Uri.parse(ApiBase.apiBaseUrl + "/api/messages"),
  //     body: jsonEncode({
  //       'text': "ahmet",
  //       'user': 1,
  //       'lesson': 3,
  //     }),
  //   );
  //   print(response.body);

  //   if (response.statusCode == 201) {
  //     return Message.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to create message.');
  //   }
  // }
  //
}
