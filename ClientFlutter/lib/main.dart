import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linkso/api/remote_data_source.dart';
import 'package:linkso/api/remote_data_source_implementation.dart';
import 'package:linkso/app.dart';
import 'package:linkso/controllers/account_controller.dart';
import 'package:linkso/controllers/main_page_controller.dart';
import 'package:linkso/controllers/menu_controller.dart';
import 'package:linkso/controllers/navigation_controller.dart';
import 'package:linkso/controllers/password_link_page_controller.dart';
import 'package:linkso/controllers/theme_controller.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  await GetStorage.init();

  final getIt = GetIt.instance;
  getIt.registerSingleton<RemoteDataSource>(RemoteDataSourceImplementation());

  Get.put(AccountController());
  Get.put(MenuController());
  Get.put(NavigationController());
  Get.put(ThemeController());

  Get.put(MainPageController());
  Get.put(PasswordLinkPageController());

  runApp(const App());
}
