import 'dart:convert';

import 'package:student_project_bitirme_flutter/apis/api_base.dart';

import 'package:http/http.dart' as http;
import 'package:student_project_bitirme_flutter/authentication/model/register_model.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/register/register_view.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/register/register_view_model.dart';

class RegisterService {
  static Future<RegisterModel?> postRegisterCreate(
      String username,
      String email,
      String firstName,
      String lastName,
      String password,
      String password2) async {
    final url = Uri.parse(ApiBase.apiBaseUrl + '/api/register/');
    final headers = {"Content-Type": "application/json"};
    Map jsonMap = {
      "username": username,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
      "password2": password2,
    };
    String body = json.encode(jsonMap);
    // print(jsonMap);
    final response = await http.post(url, headers: headers, body: body);
    // print('Status code: ${response.statusCode}');
    // print('Body: ${response.body}');
    print(response.statusCode);
    if (response.statusCode == 201) {
      print("Kayit olusturuldu");
      RegisterView.responseValue = true;

      return null;
    } else {
      if (response.statusCode == 400) {
        RegisterView.responseValue = false;

        return RegisterModel.fromJson(
            json.decode(utf8.decode(response.bodyBytes)));
      }
    }
  }
}
