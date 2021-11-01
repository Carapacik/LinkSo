import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linkso/app.dart';
import 'package:linkso/controllers/account_controller.dart';
import 'package:linkso/controllers/menu_controller.dart';
import 'package:linkso/controllers/link_controller.dart';
import 'package:linkso/controllers/main_page_controller.dart';
import 'package:linkso/controllers/navigation_controller.dart';
import 'package:linkso/controllers/theme_controller.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  await GetStorage.init();
  Get.put(AccountController());
  Get.put(MenuController());
  Get.put(LinkController());
  Get.put(NavigationController());
  Get.put(ThemeController());

  Get.put(MainPageController());

  runApp(const App());
}
