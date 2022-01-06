import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:student_project_bitirme_flutter/authentication/splash/splash_view.dart';
import 'package:student_project_bitirme_flutter/models/event.dart';

import 'package:student_project_bitirme_flutter/screens/Events/events.dart';

import 'package:student_project_bitirme_flutter/screens/home.dart';
import 'package:student_project_bitirme_flutter/screens/lessons/lessons.dart';

import 'authentication/core/auth_manager.dart';
import 'authentication/screens/login/login.dart';
import 'authentication/screens/login/login_view.dart';
import 'screens/attendances/attendances.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (context) => AuthenticationManager(context: context),
        lazy: true,
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ogrenci Katilim",
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: SplashView(),
    );
  }
}
