import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/api/remote_data_source.dart';
import 'package:linkso/api/remote_data_source_implementation.dart';

class LinkController extends GetxController {
  static LinkController instance = Get.find();
  RxString receivedLinkKey = "".obs;
  String targetLink = "";

  final baseUri = "http://localhost:5000";

  late RemoteDataSource remoteDataSource;
  late TextEditingController textController;

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
    remoteDataSource = RemoteDataSourceImplementation();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
