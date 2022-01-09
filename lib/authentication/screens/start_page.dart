import 'package:flutter/material.dart';

import 'login/login.dart';
import 'register/register.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Giris/Kayit")),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.login),
                text: "Giris Yap",
              ),
              Tab(
                icon: Icon(Icons.account_circle),
                text: "Kayit Ol",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[Login(null), Register()],
        ),
      ),
    );
  }
}
