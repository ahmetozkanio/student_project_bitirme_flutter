import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:student_project_bitirme_flutter/apis/attendance_api.dart';
import 'package:student_project_bitirme_flutter/models/lesson.dart';
import 'package:student_project_bitirme_flutter/screens/lessons/lesson_detail/lesson_tab_attendance.dart';
import 'package:student_project_bitirme_flutter/screens/lessons/lessons.dart';

import '../attendance.dart';

class AttendanceCreate extends StatefulWidget {
  AttendanceCreate({this.lesson, Key? key}) : super(key: key);
  Lesson? lesson;

  @override
  _AttendanceCreateState createState() => _AttendanceCreateState(lesson);
}

class _AttendanceCreateState extends State<AttendanceCreate> {
  Lesson? lesson;
  _AttendanceCreateState(this.lesson);
  static final GlobalKey<FormState> globalFormAttendanceKey =
      GlobalKey<FormState>();
  TextEditingController date1 = TextEditingController();
  TextEditingController date2 = TextEditingController();

  DateTime now = DateTime.now();
  static bool? isValid = false;

  final format = DateFormat("yyyy-MM-dd HH:mm");
  // Intl.defaultLocale = 'tr';
  // DateFormat.jm().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: attendanceCreate(),
    );
  }

  Scaffold attendanceCreate() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yoklama Olustur"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: globalFormAttendanceKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      lesson!.name,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  dateTimeField(date1),
                  SizedBox(
                    height: 20,
                  ),
                  dateTimeField(date2),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                        child: const Text(
                          'Yoklama Olustur',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          final form = globalFormAttendanceKey.currentState;
                          if (form != null) {
                            if (form.validate()) {
                              // int? id = await userId;
                              setState(() {
                                AttendanceApi.postAttendanceCreate(
                                    date1.text, date2.text, lesson!.id);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LessonApp()));
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

  Widget dateTimeField(TextEditingController controller) {
    return Column(children: [
      DateTimeField(
        controller: controller,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.access_time,
            color: Colors.green,
          ),
          border: OutlineInputBorder(),
          hintText: "Zaman Araligi",
        ),
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(2022),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2050));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(
                  currentValue ?? DateTime.now().toLocal()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}
