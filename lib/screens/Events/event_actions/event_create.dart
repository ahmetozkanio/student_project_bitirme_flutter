import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/event_api.dart';
import 'package:student_project_bitirme_flutter/apis/lesson_api.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';

class EventCreate extends StatefulWidget {
  EventCreate({Key? key}) : super(key: key);

  @override
  _EventCreateState createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  static final GlobalKey<FormState> globalFormLessonCreateKey =
      GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: eventCreatePage(),
    );
  }

  Scaffold eventCreatePage() {
    AuthenticationManager authManager = AuthenticationManager(context: context);
    Future<int?> userId = authManager.fetchUserId();

    bool? responseThis;
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Etkinlik Olustur"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: globalFormLessonCreateKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.school),
                        border: OutlineInputBorder(),
                        labelText: 'Etkinlik Adi',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Etkinlik adi giriniz";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.title_sharp),
                        border: OutlineInputBorder(),
                        labelText: 'Etkinlik Basligi',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Etkinlik basligi giriniz";
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
                        labelText: 'Etkinlik Aciklamasi',
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
                              "Ders Olusturulamadi!!",
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
                              "Ders Basariyla olusturuldu!",
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
                          'Dersi Olustur',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          final form = globalFormLessonCreateKey.currentState;
                          if (form != null) {
                            if (form.validate()) {
                              int? id = await userId;
                              setState(() {
                                EventApi.postEventCreate(
                                            nameController.text,
                                            descriptionController.text,
                                            titleController.text,
                                            id!) ==
                                        false
                                    ? responseThis = false
                                    : responseThis = true;
                                print(responseThis);
                              });

                              form.save();
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
