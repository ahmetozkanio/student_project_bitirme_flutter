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
}

class UserModel {
  String name;
  String ImageUrl;
  UserModel({
    required this.name,
    required this.ImageUrl,
  });

  factory UserModel.fake() {
    return UserModel(
        name: "Ahmet Ozkan",
        ImageUrl: "https://avatars.githubusercontent.com/u/65506828?v=4");
  }
}
