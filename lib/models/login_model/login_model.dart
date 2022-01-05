import 'dart:convert';

class LoginResponseModel {
  final String message;
  final Data data;
  final String code;
  final int statusCode;
  final bool success;
  LoginResponseModel({
    required this.message,
    required this.data,
    required this.code,
    required this.statusCode,
    required this.success,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data.toMap(),
      'code': code,
      'statusCode': statusCode,
      'success': success,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      message: map['message'] ?? '',
      data: Data.fromMap(map['data']),
      code: map['code'] ?? '',
      statusCode: map['statusCode']?.toInt() ?? 0,
      success: map['success'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source));
}

class Data {
  final String token;
  final int user_id;
  final String email;
  final String username;
  final String first_name;
  final String last_name;
  Data({
    required this.token,
    required this.user_id,
    required this.email,
    required this.username,
    required this.first_name,
    required this.last_name,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'user_id': user_id,
      'email': email,
      'username': username,
      'first_name': first_name,
      'last_name': last_name,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      token: map['token'] ?? '',
      user_id: map['user_id']?.toInt() ?? 0,
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}
