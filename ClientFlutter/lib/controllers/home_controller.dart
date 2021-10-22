import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxString receivedLink = "".obs;
}
