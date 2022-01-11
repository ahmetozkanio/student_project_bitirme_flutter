import 'dart:convert';

class User {
  final int id;

  final bool is_staff;
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final String date_joined;
  User({
    required this.id,
    required this.is_staff,
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.date_joined,
  });

  factory User.fromJson(Map map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      is_staff: map['is_staff'] ?? false,
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
      'is_staff': is_staff,
      'username': username,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'date_joined': date_joined,
    };
  }

  String toJson() => json.encode(toMap());
}
