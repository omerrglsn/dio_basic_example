import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_example/model/usermodel.dart';

class UserService {
  UserService(this.dio);

  final Dio dio;

  Future<UserModel?> fetchUsers() async {
    final response = await dio.get('/users?page=2');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;

      if (jsonBody is Map<String, dynamic>) {
        return UserModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
