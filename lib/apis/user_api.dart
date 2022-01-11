import 'api_base.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future getUsers() {
    return http.get(Uri.parse(ApiBase.apiBaseUrl + "/api/users"));
  }
}
