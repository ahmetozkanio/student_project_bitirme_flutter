import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/apis/lesson_api.dart';
import 'package:student_project_bitirme_flutter/authentication/core/auth_manager.dart';

class LessonCreate extends StatefulWidget {
  LessonCreate({Key? key}) : super(key: key);

  @override
  _LessonCreateState createState() => _LessonCreateState();
}

class _LessonCreateState extends State<LessonCreate> {
  static final GlobalKey<FormState> globalFormLessonCreateKey =
      GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController teacherController = TextEditingController();
  String? _name;
  String? _description;
  int? _teacher;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: lessonCreatePage(),
    );
  }

  Scaffold lessonCreatePage() {
    AuthenticationManager authManager = AuthenticationManager(context: context);
    Future<int?> userId = authManager.fetchUserId();

    bool? responseThis;
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ders Olustur"),
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
                        labelText: 'Ders Adi',
                      ),
                      onSaved: (String? value) {
                        _name = value.toString().trim();
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Ders adi giriniz";
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
                        labelText: 'Ders Aciklamasi',
                      ),
                      onSaved: (String? value) {
                        _description = value.toString().trim();
                      },
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
                                LessonApi.postLessonCreate(nameController.text,
                                    descriptionController.text, id!);
                                Navigator.pop(context, "Success");
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
