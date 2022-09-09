import 'package:dio/dio.dart';
import 'package:dio_example/model/usermodel.dart';
import 'package:dio_example/service/user_service.dart';
import 'package:flutter/foundation.dart';

class UserViewModel {
  UserService userService = UserService(Dio(BaseOptions(baseUrl: 'https://reqres.in/api')));

  ValueNotifier<List<Data>> users = ValueNotifier<List<Data>>(UserModel().data ?? []);

  Future<void> fetch() async {
    users.value = (await userService.fetchUsers())?.data ?? [];
  }
}
