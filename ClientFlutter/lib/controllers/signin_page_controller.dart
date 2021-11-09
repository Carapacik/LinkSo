import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:linkso/api/remote_data_source.dart';
import 'package:linkso/model/login_request.dart';
import 'package:linkso/model/register_request.dart';

class SignInPageController extends GetxController {
  static SignInPageController instance = Get.find();

  final RxBool registered = false.obs;
  String? email;
  String? login;
  String? password;

  void swapRegistered() {
    registered.value = !registered.value;
  }

  Future<void> register(FormState form) async {
    if (form.validate()) {
      form.save();
      final _apiResponse = await GetIt.instance.get<RemoteDataSource>().register(
            RegisterRequest(
              email: email ?? "",
              login: login ?? "",
              password: password ?? "",
            ),
          );
      print("Token = ${_apiResponse.data}");
    }
  }

  Future<void> logIn(FormState form) async {
    if (form.validate()) {
      form.save();
      final _apiResponse = await GetIt.instance.get<RemoteDataSource>().login(
            LoginRequest(
              login: login ?? "",
              password: password ?? "",
            ),
          );
      print("Token = ${_apiResponse.data}");
    }
  }
}
