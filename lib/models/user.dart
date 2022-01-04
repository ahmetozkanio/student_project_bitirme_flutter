import 'dart:convert';

class User {
  final int id;
  final String password;
  final String last_login;
  final bool is_superuser;
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final String date_joined;
  User({
    required this.id,
    required this.password,
    required this.last_login,
    required this.is_superuser,
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.date_joined,
  });

  factory User.fromJson(Map map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      password: map['password'] ?? '',
      last_login: map['last_login'] ?? '',
      is_superuser: map['is_superuser'] ?? false,
      username: map['username'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      email: map['email'] ?? '',
      date_joined: map['date_joined'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'last_login': last_login,
      'is_superuser': is_superuser,
      'username': username,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'date_joined': date_joined,
    };
  }

  String toJson() => json.encode(toMap());
}
