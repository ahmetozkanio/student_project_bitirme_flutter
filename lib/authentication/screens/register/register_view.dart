import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/authentication/model/register_model.dart';
import 'package:student_project_bitirme_flutter/authentication/screens/register/register.dart';
import 'package:student_project_bitirme_flutter/authentication/service/register_service.dart';
import '../start_page.dart';
import './register_view_model.dart';

class RegisterView extends RegisterViewModel {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lasttNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  static final GlobalKey<FormState> globalRegisterFormKey =
      GlobalKey<FormState>();

  static RegisterModel? responseThis;

  static bool? responseValue;

  bool? api;
  bool isChecked = false; //ogretmen

  @override
  Widget build(BuildContext context) {
    setState(() {
      api = responseValue;
    });
    // Replace this with your build function
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: globalRegisterFormKey,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Kayit',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: CheckboxListTile(
                    checkColor: Colors.white,
                    value: isChecked,
                    title: Text("Ogretmen"),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Lutfen kullanici adi girin ";
                      }
                      // if (responseValue == false) if (responseThis?.username !=
                      //     null) {
                      //   return responseThis?.username.toString();
                      // }
                    },
                    controller: usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity),
                      border: OutlineInputBorder(),
                      labelText: 'Kullanici Adi',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Lutfen email giriniz ";
                      }
                      if (!value.contains('@')) {
                        return "@ eksik tanimladiniz. ";
                      }
                      // if (responseThis?.email != null) {
                      //   return responseThis?.email.toString();
                      // }
                    },
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Lutfen isim giriniz ";
                      }
                      // if (responseThis?.first_name != null) {
                      //   return responseThis?.first_name.toString();
                      // }
                    },
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.face),
                      border: OutlineInputBorder(),
                      labelText: 'Isim',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Lutfen soy isim giriniz ";
                      }
                      // if (responseThis?.last_name != null) {
                      //   return responseThis?.last_name.toString();
                      // }
                    },
                    controller: lasttNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.face_outlined),
                      border: OutlineInputBorder(),
                      labelText: 'Soy Isim',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Lutfen sifre giriniz ";
                      }
                      // if (passwordController != password2Controller) {
                      //   return "Sifreler ayni degil!.";
                      // }
                      if (value.length < 8) {
                        return "Sifre en az 8 karakter icermeli";
                      }
                      // if (responseThis?.password != null) {
                      //   return responseThis?.password.toString();
                      // }
                    },
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      labelText: 'Sifre',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Lutfen sifreyi tekrar giriniz. ";
                      }
                      if (passwordController.text != value) {
                        return "Sifreler ayni degil!.";
                      }
                      if (value.length < 8) {
                        return "Sifre en az 8 karakter icermeli";
                      }
                      // if (responseValue == false) if (responseThis?.password !=
                      //     null) {
                      //   return responseThis!.password.toString();
                      // }
                    },
                    obscureText: true,
                    controller: password2Controller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                      labelText: 'Sifre Onayi',
                    ),
                  ),
                ),
                if (api == false) requestErrorValue(),
                if (api == true) requestSuccessValue(),
                Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: const Text(
                        'Kayit Ol',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        final form = globalRegisterFormKey.currentState;

                        if (form != null) {
                          if (form.validate()) {
                            form.save();

                            setState(() {
                              userCreate(
                                  usernameController.text,
                                  emailController.text,
                                  firstNameController.text,
                                  lasttNameController.text,
                                  passwordController.text,
                                  password2Controller.text,
                                  isChecked);
                            });
                          }
                        }
                      },
                    )),
              ],
            )),
      ),
    );
  }

  requestSuccessValue() {
    if (responseValue == true) {
      return Container(
        child: Column(
          children: const [
            Text(
              "Kayi Basarili.",
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  requestErrorValue() {
    if (responseValue == false) {
      return Container(
        child: Column(
          children: [
            const Text(
              "Kayit Bararisiz.",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                if (responseThis?.username != null)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        "Kullanici adi : " + responseThis!.username.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                // ignore: unnecessary_null_comparison
                if (responseThis?.email != null)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        "E-mail : " + responseThis!.email.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),

                if (responseThis?.password != null)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        "Sifre : " + responseThis!.password.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();
  }
}
