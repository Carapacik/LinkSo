import 'package:get/get.dart';

class AccountController extends GetxController {
  static AccountController instance = Get.find();
  RxBool isAuth = false.obs;
}
