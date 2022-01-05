import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_project_bitirme_flutter/models/event.dart';
import 'package:student_project_bitirme_flutter/models/login_model/shared_service.dart';
import 'package:student_project_bitirme_flutter/screens/Events/events.dart';
import 'package:student_project_bitirme_flutter/screens/accounts/login.dart';
import 'package:student_project_bitirme_flutter/screens/accounts/login_page.dart';
import 'package:student_project_bitirme_flutter/screens/home.dart';
import 'package:student_project_bitirme_flutter/screens/lessons/lessons.dart';
import 'screens/attendances/attendances.dart';

Widget _defaultHome = LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedServise.isLoggedIn();

  if (_result) {
    _defaultHome = HomeApp();
  }
  runApp(MyApp());
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: _defaultHome,
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeApp(),
          '/login': (BuildContext context) => LoginPage(),
        });
  }
}
