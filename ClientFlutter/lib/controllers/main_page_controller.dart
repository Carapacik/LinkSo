import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:linkso/api/remote_data_source.dart';
import 'package:linkso/api/remote_data_source_implementation.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/model/link_create_request.dart';

class MainPageController extends GetxController {
  static MainPageController instance = Get.find();

  final RxBool checkBool = false.obs;
  RxString receivedLinkKey = "".obs;
  String targetLink = "";
  String? passwordLink;

  final baseUri = "http://localhost:5000";

  late RemoteDataSource remoteDataSource;

  @override
  void onInit() {
    super.onInit();
    remoteDataSource = RemoteDataSourceImplementation();
  }

  Future<void> getResultKey(FormState form) async {
    if (form.validate()) {
      form.save();
      final _receivedLink = await GetIt.instance.get<RemoteDataSource>().createLink(
            LinkCreateRequest(
              target: targetLink,
              password: passwordLink,
              linkType: checkBool.value ? 1 : 0,
            ),
          );
      receivedLinkKey.value = _receivedLink.key;
    }
  }

  void changeCheckBoolValue() {
    mainPageController.checkBool.value = !mainPageController.checkBool.value;
  }
}
