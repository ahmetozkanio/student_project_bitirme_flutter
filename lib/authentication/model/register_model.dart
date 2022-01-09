import 'dart:convert';

class RegisterModel {
  List? username;
  List? email;
  List? first_name;
  List? last_name;
  List? password;
  RegisterModel({
    this.username,
    this.email,
    this.first_name,
    this.last_name,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'passoword': password,
    };
  }

  factory RegisterModel.fromJson(Map<String, dynamic> map) {
    return RegisterModel(
      username: map['username'],
      email: map['email'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      password: map['password'],
    );
  }
}
