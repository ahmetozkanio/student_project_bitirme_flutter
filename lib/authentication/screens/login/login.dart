import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/login/login_view_model.dart';

import '/apis/api_base.dart';
import '../register/register.dart';
import 'login_view.dart';

class Login extends StatefulWidget {
  Login(this.name);
  String? name;
  @override
  LoginView createState() => LoginView(username: name);
}
