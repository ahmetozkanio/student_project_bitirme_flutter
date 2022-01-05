import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_model.dart';

class SharedServise {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null ? true : false;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null
        ? LoginResponseModel.fromJson(
            prefs.getString("login_details").toString(),
          )
        : null;
  }

  static Future<void> setLoginDetails(LoginResponseModel? responseModel) async {
    final prefs = await SharedPreferences.getInstance();
    if (responseModel != null)
      prefs.setString("login_details", responseModel.toJson());
    else {
      prefs.setString("login_details", null.toString());
    }
  }

  static Future<void> logout(BuildContext context) async {
    await setLoginDetails(null);
    Navigator.of(context).pushReplacementNamed("/login");
  }
}
