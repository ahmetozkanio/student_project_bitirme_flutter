import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_base.dart';

class MessageApi with ApiBase {
  static Future getMessage(int lessonId) {
    return http.get(Uri.parse(ApiBase.apiBaseUrl +
        "/api/lesson/" +
        "$lessonId" +
        "/messages" +
        "/?format=json"));
  }

  static Future postMessage(int lessonId, String text) {
    return http.post(Uri.parse(ApiBase.apiBaseUrl +
        "/api/lesson/" +
        "$lessonId" +
        "/messages" +
        "/?format=json"));
  }
}
