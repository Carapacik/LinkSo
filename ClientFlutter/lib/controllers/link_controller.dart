import 'package:get/get.dart';

class LinkController extends GetxController {
  static LinkController instance = Get.find();
  RxString receivedLinkKey = "".obs;
}
