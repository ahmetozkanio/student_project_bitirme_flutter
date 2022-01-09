import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_project_bitirme_flutter/apis/api_base.dart';
import '/authentication/core/auth_manager.dart';
import '/authentication/model/user_request_model.dart';
import '/authentication/core/cache_manager.dart';
import '/authentication/service/login_service.dart';
import '/screens/home.dart';

import 'login.dart';
import 'login_view.dart';

abstract class LoginViewModel extends State<Login> with CacheManager {
  late final LoginService loginService;
  final _baseUrl = ApiBase.apiBaseUrl;
  bool? _response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginService = LoginService(Dio(BaseOptions(baseUrl: _baseUrl)));
  }

  void fetchUserLogin(String username, String password) async {
    final response = await loginService
        .fetchLogin(UserRequestModel(username: username, password: password));

    if (response != null) {
      saveTokenId(response.token ?? '', response.userId.toString());
      navigateToHome();
    } else {
      if (response == null) {
        setState(() {
          _response = false;

          LoginView.responseThis = _response;
        });
      }
    }
  }

  void navigateToHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => HomeApp(),
      ),
      (route) => false,
    );
  }
}
