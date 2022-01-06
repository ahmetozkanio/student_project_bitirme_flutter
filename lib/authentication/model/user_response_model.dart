class UserResponseModel {
  String? token;
  int? userId;

  UserResponseModel({this.token, this.userId});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.userId;
    return data;
  }
}
