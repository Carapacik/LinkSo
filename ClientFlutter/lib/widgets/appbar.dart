import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/helpers/responsiveness.dart';

AppBar topNav(BuildContext context, GlobalKey<ScaffoldState> key) {
  final locale = Localizations.localeOf(context);

  Locale _getLocale(Locale l) {
    switch (l.languageCode) {
      case 'en':
        return const Locale('ru', 'RU');
      case 'ru':
      default:
        return const Locale('en', '');
    }
  }

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? const Center(child: Text("LinkSo"))
        : IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              key.currentState?.openDrawer();
            },
          ),
    actions: [
      // IconButton(
      //   onPressed: () {
      //     themeController.switchTheme();
      //   },
      //   icon: const Icon(Icons.nightlight_round),
      // ),
      // IconButton(
      //   onPressed: () {
      //     Get.updateLocale(_getLocale(locale));
      //   },
      //   icon: const Icon(Icons.language),
      // ),
      Stack(
        children: [
          Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ),
          Positioned(
            top: 12,
            right: 7,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    ],
  );
}
