// import 'package:flutter/material.dart';
// import '/apis/api_base.dart';
// import '../login/login.dart';

// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);

//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lasttNameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController password2Controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(15.0),
//       padding: EdgeInsets.all(15.0),
//       child: Form(
//         child: Padding(
//             padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'Kayit',
//                       style: TextStyle(fontSize: 20),
//                     )),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "bos ";
//                       }
//                       bool? _response;
//                     },
//                     controller: usernameController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(Icons.perm_identity),
//                       border: OutlineInputBorder(),
//                       labelText: 'Kullanici Adi',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(Icons.alternate_email),
//                       border: OutlineInputBorder(),
//                       labelText: 'E-mail',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextField(
//                     controller: firstNameController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(Icons.face),
//                       border: OutlineInputBorder(),
//                       labelText: 'Isim',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextField(
//                     controller: lasttNameController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(Icons.face_outlined),
//                       border: OutlineInputBorder(),
//                       labelText: 'Soy Isim',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextField(
//                     obscureText: true,
//                     controller: passwordController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(),
//                       labelText: 'Sifre',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextField(
//                     obscureText: true,
//                     controller: password2Controller,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(Icons.lock_outline),
//                       border: OutlineInputBorder(),
//                       labelText: 'Sifre Onayi',
//                     ),
//                   ),
//                 ),
//                 Container(
//                     height: 60,
//                     padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                     child: ElevatedButton(
//                       child: const Text(
//                         'Kayit Ol',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       onPressed: () {
//                         print(usernameController.text);
//                         print(passwordController.text);
//                       },
//                     )),
//               ],
//             )),
//       ),
//     );
//   }
// }
