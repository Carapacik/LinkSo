import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/resources/palette.dart';
import 'package:linkso/routing.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  RxString activeItem = overviewPageRoute.obs;
  RxString hoverItem = "".obs;
  RxBool isDarkMode = false.obs;

  void changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  void onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  void changeTheme(bool state) {
    final _themeMode = state ? ThemeMode.dark : ThemeMode.light;
    isDarkMode.value = !state;
    Get.changeThemeMode(_themeMode);
  }

  bool isActive(String itemName) => activeItem.value == itemName;

  bool isHover(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case driversPageRoute:
        return _customIcon(Icons.drive_eta, itemName);
      case clientsPageRoute:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case authenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: AppColors.dark);

    return Icon(icon, color: isHover(itemName) ? AppColors.dark : AppColors.light);
  }
}
