import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/model/link_create_request.dart';

class MainPageController extends GetxController {
  static MainPageController instance = Get.find();

  Future<void> getResultKey(FormState form) async {
    if (form.validate()) {
      form.save();
      final _receivedLinkInfo = await linkController.remoteDataSource.createLink(
        LinkCreateRequest(target: linkController.targetLink),
      );
      linkController.receivedLinkKey.value = _receivedLinkInfo.key;
    }
  }
}
