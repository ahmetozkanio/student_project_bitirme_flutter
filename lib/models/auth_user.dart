class UserModel {
  int id;

  UserModel({
    required this.id,
  });

  factory UserModel.id() {
    return UserModel(
      id: 2,
    );
  }
}
