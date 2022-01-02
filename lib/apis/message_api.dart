import 'package:http/http.dart' as http;
import 'api_base.dart';

class MessageApi with ApiBase {
  static Future getMessage(int lessonId) {
    lessonId;
    return http.get(Uri.parse(ApiBase.apiBaseUrl +
        "/api/lesson/" +
        "$lessonId" +
        "/messages" +
        "/?format=json"));
  }

  static Future getMessages() {
    return http
        .get(Uri.parse(ApiBase.apiBaseUrl + "/api/messages/?format=json"));
  }
}
