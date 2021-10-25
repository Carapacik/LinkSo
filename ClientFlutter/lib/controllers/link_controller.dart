import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkController extends GetxController {
  static LinkController instance = Get.find();
  RxString receivedLinkKey = "".obs;
  String targetLink = "";

  late TextEditingController textController;

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
