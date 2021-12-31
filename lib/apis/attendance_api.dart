import 'package:http/http.dart' as http;
import 'package:student_project_bitirme_flutter/models/attendance.dart';

class AttendanceApi {
  static Future getAttendance() {
    return http
        .get(Uri.parse("http://10.0.3.2:8000/api/attendances/?format=json"));
  }
}
