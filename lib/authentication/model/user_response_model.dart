class UserResponseModel {
  String? token;
  int? userId;
  bool? isStaff;

  UserResponseModel({this.token, this.userId, this.isStaff});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    isStaff = json['is_staff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['user_id'] = userId;
    data['is_staff'] = isStaff;

    return data;
  }
}
