import 'package:http/http.dart' as http;
import 'api_base.dart';

class AttendanceApi with ApiBase {
  static Future getAttendance() {
    return http
        .get(Uri.parse(ApiBase.apiBaseUrl + "/api/attendances/?format=json"));
  }
}
