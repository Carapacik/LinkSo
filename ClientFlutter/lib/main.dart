import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/app.dart';
import 'package:linkso/controllers/menu_controller.dart';
import 'package:linkso/controllers/navigation_controller.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const App());
}
