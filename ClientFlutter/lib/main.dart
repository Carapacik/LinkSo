import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/app.dart';
import 'package:linkso/controllers/menu_controller.dart';

void main() async {
  Get.put(MenuController());
  runApp(const App());
}
