import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:linkso/api/remote_data_source.dart';
import 'package:linkso/model/link_access_request.dart';
import 'package:url_launcher/url_launcher.dart';

class PasswordLinkPageController extends GetxController {
  static PasswordLinkPageController instance = Get.find();

  final RxString password = "".obs;
  final RxString key = "".obs;

  Future<void> requestAccess(FormState form) async {
    if (form.validate()) {
      form.save();
      final _link = await GetIt.instance.get<RemoteDataSource>().checkAccess(
            LinkAccessRequest(
              password: password.value,
              key: key.value,
            ),
          );

      await launch(jsonDecode(_link) as String);
    }
  }
}
