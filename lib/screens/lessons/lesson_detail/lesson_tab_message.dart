import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';
import 'package:student_project_bitirme_flutter/authentication/model/user_response_model.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/login/login_view.dart';
import '/apis/message_api.dart';
import '/models/message.dart';

class LessonTabMessagePage extends StatefulWidget {
  LessonTabMessagePage(this.lessonId, {Key? key}) : super(key: key);
  int lessonId;

  @override
  _LessonTabMessagePageState createState() =>
      _LessonTabMessagePageState(lessonId);
}

class _LessonTabMessagePageState extends State<LessonTabMessagePage> {
  _LessonTabMessagePageState(this.lessonId);

  int lessonId;
  List<Message>? messageList = <Message>[];
  final TextEditingController _controllerMessage = TextEditingController();
  Future<Message>? _futureMessage;

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = AuthenticationManager(context: context);
    Future<int?> userId = authManager.fetchUserId();
    return Container(
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  for (var message in messageList!)
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(
                          message.user.username.toUpperCase() +
                              " :   " +
                              message.text.trim(),
                        ),
                        subtitle: Text(message.date!),
                      ),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  child: Icon(
                    Icons.message,
                    color: Colors.blue[600],
                  ),
                  margin: EdgeInsets.only(left: 15.0, right: 5.0),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: TextField(
                      controller: _controllerMessage,
                      onSubmitted: (String text) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Mesajiniz',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      int? id = await userId;
                      MessageApi.postMessage(
                        _controllerMessage.text,
                        lessonId,
                        id!,
                      );

                      getMessage();
                    },
                    child: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // postMessage(String text){
  //   MessageApi.postMessage(lessonId,text).then(response){
  //     setState({

  //     });
  //   }
  // }

  getMessage() async {
    MessageApi.getMessage(lessonId).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        messageList = list.map((message) => Message.fromJson(message)).toList();
      });
    });
  }

  @override
  void initState() {
    getMessage();
    super.initState();
  }
}
