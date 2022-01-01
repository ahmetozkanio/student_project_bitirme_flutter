import 'package:http/http.dart' as http;
import 'api_base.dart';

class EventApi with ApiBase {
  static Future getEvent() {
    return http.get(Uri.parse(ApiBase.apiBaseUrl + "/api/events/?format=json"));
  }
}
