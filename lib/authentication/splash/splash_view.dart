import 'package:flutter/material.dart';

import 'package:provider/src/provider.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/login/login.dart';
import 'package:student_project_bitirme_flutter/screens/home.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void controlToApp() async {
    await readAuthManager.fetchUserLogin();

    if (readAuthManager.isLogin) {
      await Future.delayed(
        Duration(seconds: 1),
      );
      readAuthManager.model = UserModel.fake();
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => HomeApp()));
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => HomeApp(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    } else {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => Login(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    }
  }

  AuthenticationManager get readAuthManager =>
      context.read<AuthenticationManager>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controlToApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
