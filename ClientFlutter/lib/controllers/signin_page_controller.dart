import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:linkso/api/remote_data_source.dart';
import 'package:linkso/model/register_request.dart';

class SignInPageController extends GetxController {
  static SignInPageController instance = Get.find();

  String? email;
  String? login;
  String? password;

  Future<void> signIn(FormState form) async {
    if (form.validate()) {
      form.save();
      final _receivedToken = await GetIt.instance.get<RemoteDataSource>().register(
            RegisterRequest(
              email: email ?? "",
              login: login ?? "",
              password: password ?? "",
            ),
          );
      print("Token = $_receivedToken");
    }
  }
}
