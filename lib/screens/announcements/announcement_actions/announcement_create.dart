import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/announcement_api.dart';
import 'package:student_project_bitirme_flutter/apis/event_api.dart';
import 'package:student_project_bitirme_flutter/apis/lesson_api.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';
import 'package:student_project_bitirme_flutter/models/lesson.dart';

class AnnouncementCreate extends StatefulWidget {
  AnnouncementCreate({this.lesson, Key? key}) : super(key: key);
  Lesson? lesson;
  @override
  _AnnouncementCreateState createState() => _AnnouncementCreateState(lesson);
}

class _AnnouncementCreateState extends State<AnnouncementCreate> {
  Lesson? lesson;

  _AnnouncementCreateState(this.lesson);
  static final GlobalKey<FormState> globalFormAnnouncementCreateKey =
      GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: announcementCreatePage(),
    );
  }

  Scaffold announcementCreatePage() {
    // AuthenticationManager authManager = AuthenticationManager(context: context);
    // Future<int?> userId = authManager.fetchUserId();

    bool? responseThis;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Duyuru Olustur"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: globalFormAnnouncementCreateKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(lesson!.name)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.notifications),
                        border: OutlineInputBorder(),
                        labelText: 'Duyuru Basligi',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Duyuru basligi giriniz";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.description),
                        border: OutlineInputBorder(),
                        labelText: 'Duyuru Aciklamasi',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Aciklama giriniz";
                        }
                        return null;
                      },
                    ),
                  ),
                  if (responseThis != null)
                    if (responseThis == false)
                      Center(
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Duyuru Olusturulamadi!",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                  if (responseThis != null)
                    if (responseThis == true)
                      Center(
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Duyuru Basariyla olusturuldu!",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                        child: const Text(
                          'Duyuru Olustur',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          final form =
                              globalFormAnnouncementCreateKey.currentState;
                          if (form != null) {
                            if (form.validate()) {
                              // int? id = await userId;
                              setState(() {
                                AnnouncementApi.postAnnouncementCreate(
                                    titleController.text,
                                    descriptionController.text,
                                    lesson!.id);
                                Navigator.pop(context, "Success");
                              });

                              form.save();
                            } else {
                              setState(() {
                                responseThis = false;
                              });
                            }
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
