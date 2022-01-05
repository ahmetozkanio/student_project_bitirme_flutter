import 'package:http/http.dart' as http;
import 'package:student_project_bitirme_flutter/models/login_model/shared_service.dart';
import '/models/login_model/login_model.dart';
import '../api_base.dart';

class LoginApiServices with ApiBase {
  static var client = http.Client();

  static Future<bool> loginUser(String username, String password) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded'
    };
    var response = await client.post(
        Uri.parse("${ApiBase.apiBaseUrl}/api/api-token-auth/"),
        headers: requestHeaders,
        body: {"username": username, "password": password});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      LoginResponseModel responseModel =
          LoginResponseModel.fromJson(jsonString);

      if (responseModel.statusCode == 200) {
        SharedServise.setLoginDetails(responseModel);
      }

      return responseModel.statusCode == 200 ? true : false;
    }

    return false;
  }
}
