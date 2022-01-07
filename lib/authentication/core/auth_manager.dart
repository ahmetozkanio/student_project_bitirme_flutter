import 'dart:convert';

import 'package:flutter/material.dart';

import '/authentication/screens/login/login.dart';
import 'cache_manager.dart';

class AuthenticationManager extends CacheManager {
  BuildContext context;

  AuthenticationManager({
    required this.context,
  }) {
    if (isLogin == false) {
      fetchUserLogin();
    }
  }

  bool isLogin = false;

  UserModel? model;

  void removeAllData() {}

  Future<void> fetchUserLogout() async {
    await removeToken();

    final token = await getToken();

    if (token != null) {
      isLogin = true;
    } else {
      isLogin = false;
      model = null;
      if (isLogin == false) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Login(),
          ),
          (route) => false,
        );
      }
    }
  }

  Future<void> fetchUserLogin() async {
    final token = await getToken();

    if (token != null) {
      isLogin = true;
    }
  }

  Future<int?> fetchUserId() async {
    final userId = await getAuthUserId();
    if (userId != null) {
      int id = int.parse(userId);
      UserModel(id: id);
      return id;
    }
  }
}

class UserModel {
  int id;

  UserModel({
    required this.id,
  });
}
