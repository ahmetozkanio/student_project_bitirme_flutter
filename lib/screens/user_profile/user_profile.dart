import 'dart:convert';

import 'package:flutter/material.dart';
import '/apis/user_api.dart';
import '/models/user.dart';

class UserProfile extends StatefulWidget {
  UserProfile({this.id, Key? key}) : super(key: key);
  int? id;
  @override
  _UserProfileState createState() => _UserProfileState(id!);
}

class _UserProfileState extends State<UserProfile> {
  _UserProfileState(this.id);
  List<User> userProfileList = <User>[];
  int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Bilgilerim"),
      ),
      body: Column(children: [
        for (var user in userProfileList)
          if (user.id == id)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 70,
                      color: Colors.green,
                    ),
                    if (user.is_staff)
                      Row(
                        children: [
                          Text(
                            "Yetki : ",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Text(
                            "Ogretmen",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    if (!user.is_staff)
                      Text(
                        "Yetki : Ogrenci",
                        style: TextStyle(fontSize: 18),
                      ),
                    Text(
                      "Kullanci Adi : " + user.username,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Isim : " + user.first_name,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Soy Isim " + user.last_name,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "E-mail : " + user.email,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Uyelik tarihi : " + user.date_joined,
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [],
                    )
                  ],
                ),
              ),
            ),
      ]),
    );
  }

  getUserProfile() async {
    UserApi.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        userProfileList = list.map((user) => User.fromJson(user)).toList();
      });
    });
  }

  @override
  void initState() {
    getUserProfile();
    super.initState();
  }
}
