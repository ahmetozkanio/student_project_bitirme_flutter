import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/login/login.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/register/register_view.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/start_page.dart';
import 'package:student_project_bitirme_flutter/authentication/service/register_service.dart';
import './register.dart';

abstract class RegisterViewModel extends State<Register> {
  // Add your state and logic here
  String? name;

  void userCreate(String username, String email, String firstName,
      String lastName, String password, String password2) async {
    this.name = username;
    final response = await RegisterService.postRegisterCreate(
        username, email, firstName, lastName, password, password2);

    if (response != null) {
      setState(() {
        RegisterView.responseThis = response;
      });
    }
    if (response == null) {
      navigateToLogin();
    }
  }

  void navigateToLogin() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Login(name),
      ),
      (route) => true,
    );
  }
}
