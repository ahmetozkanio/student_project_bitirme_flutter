import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/start_page.dart';
import 'package:student_project_bitirme_flutter/screens/lessons/lessons.dart';

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
            builder: (BuildContext context) => StartPage(),
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
    final isStaff = await getAuthUserIsStaff();

    if (userId != null) {
      UserModel(id: userId, isStaff: isStaff);
      return userId;
    }
  }

  Future<bool?> fetchUserIsStaff() async {
    final isStaff = await getAuthUserIsStaff();

    if (isStaff != null) {
      return isStaff;
    }
  }
}

class UserModel {
  int? id;
  bool? isStaff;

  UserModel({required this.id, required this.isStaff});
}
