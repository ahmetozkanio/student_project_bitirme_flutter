import 'package:flutter/material.dart';
import 'package:student_project_bitirme_flutter/authentication/model/user_request_model.dart';
import '/authentication/screens/login/validation_mixin.dart';
import './login_view_model.dart';
import '../register.dart';

class LoginView extends LoginViewModel {
  String? _username;
  String? _password;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static bool? responseThis;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: globalFormKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.network(
                    "https://iste.edu.tr/files/iste_arma.png",
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Giris',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Kullanici Adi',
                    ),
                    onSaved: (String? value) {
                      _username = value.toString().trim();
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Username giriniz";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      labelText: 'Sifre',
                    ),
                    onSaved: (String? value) {
                      _password = value.toString().trim();
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "password giriniz";
                      }
                      return null;
                    },
                  ),
                ),
                if (responseThis == false)
                  Center(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Parola veya Kullanici adiniz yanlis!!",
                          style: TextStyle(
                            color: Colors.red,
                          ),
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
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);

                        final form = globalFormKey.currentState;
                        if (form != null) {
                          if (form.validate()) {
                            form.save();
                            fetchUserLogin(
                                nameController.text, passwordController.text);
                          }
                        }
                      }),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      const Text('Hesap Olustur........'),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                        onPressed: () {},
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'What do people call you?',
        labelText: 'Name *',
      ),
      onSaved: (String? value) {
        _username = value.toString().trim();
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Username giriniz";
        }
        return null;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Sifrenizi giriniz.',
        labelText: 'Sifre *',
      ),
      obscureText: true,
      onSaved: (String? value) {
        _password = value.toString().trim();
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return "password giriniz";
        }
        return null;
      },
    );
  }
}



// Scaffold(
//         body: Padding(
//             padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                   child: Image.network(
//                     "https://iste.edu.tr/files/iste_arma.png",
//                     width: 100.0,
//                     height: 100.0,
//                   ),
//                 ),
//                 Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'Giris',
//                       style: TextStyle(fontSize: 20),
//                     )),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Kullanici Adi',
//                         errorText:
//                              nameController.text != null ? :null

//                             ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextField(
//                     obscureText: true,
//                     controller: passwordController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Sifre',
//                     ),
//                   ),
//                 ),
//                 Container(
//                     height: 60,
//                     padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                     child: ElevatedButton(
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       onPressed: () {
//                         print(nameController.text);
//                         print(passwordController.text);
//                       },
//                     )),
//                 Container(
//                     child: Row(
//                   children: <Widget>[
//                     const Text('Hesap Olustur........'),
//                     TextButton(
//                       child: const Text(
//                         'Sign in',
//                         style: TextStyle(fontSize: 20, color: Colors.blue),
//                       ),
//                       onPressed: () {
//                         print(nameController);
//                         print(passwordController);
//                         fetchUserLogin(
//                             nameController.text, passwordController.text);
//                         //   Navigator.push(
//                         //       context,
//                         //       MaterialPageRoute(
//                         //           builder: (context) => const RegisterApp()));
//                       },
//                     )
//                   ],
//                   mainAxisAlignment: MainAxisAlignment.center,
//                 ))
//               ],
//             )));