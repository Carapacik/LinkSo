import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkController extends GetxController {
  static LinkController instance = Get.find();
  RxString receivedLinkKey = "".obs;
  String targetLink = "";

  late TextEditingController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
