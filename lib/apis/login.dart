import 'package:http/http.dart' as http;
import 'api_base.dart';

class LessonApi with ApiBase {
  static Future getLesson() {
    return http.post(Uri.parse(ApiBase.apiBaseUrl + "/api/api-token-auth"));
  }
}
