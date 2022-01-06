import 'dart:io';

import 'package:dio/dio.dart';
import 'package:student_project_bitirme_flutter/authentication/model/user_request_model.dart';
import 'package:student_project_bitirme_flutter/authentication/model/user_response_model.dart';

abstract class ILoginSevice {
  final String path = '/api/api-token-auth/';

  ILoginSevice(this.dio);

  Future<UserResponseModel?> fetchLogin(UserRequestModel model);
  final Dio dio;
}

class LoginService extends ILoginSevice {
  LoginService(Dio dio) : super(dio);

  @override
  Future<UserResponseModel?> fetchLogin(UserRequestModel model) async {
    final response = await dio.post(
      path,
      data: model,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.statusCode == HttpStatus.ok) {
      return UserResponseModel.fromJson(response.data);
    } else if (response.statusCode == HttpStatus.badRequest) return null;
    return null;
  }
}
