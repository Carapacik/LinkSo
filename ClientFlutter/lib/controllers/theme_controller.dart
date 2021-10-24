import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();
  final _key = 'isDarkMode';
  final isDarkMode = false.obs;
  late GetStorage _box;

  @override
  void onInit() {
    super.onInit();
    _box = GetStorage();
    isDarkMode.value = _readFromBox();
  }

  bool _readFromBox() => _box.read(_key) ?? false;

  Future<void> _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme(BuildContext context) {
    final currentMode = isDarkMode.value;
    final newThemeMode = currentMode ? ThemeMode.light : ThemeMode.dark;
    Get.changeThemeMode(newThemeMode);
    _saveThemeToBox(!currentMode);
    isDarkMode.value = !currentMode;
  }
}
