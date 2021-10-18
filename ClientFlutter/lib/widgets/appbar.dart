import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/resources/palette.dart';

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
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14),
                child: const Text("SO", style: TextStyle(color: Colors.black)),
              ),
            ],
          )
        : IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              key.currentState?.openDrawer();
            },
          ),
    elevation: 0,
    title: Text(AppLocalizations.of(context)!.appTitle),
    actions: [
      Obx(
        () => Switch(
          value: menuController.isDarkMode.value,
          onChanged: (state) {
            menuController.changeTheme(state);
          },
        ),
      ),
      IconButton(
        onPressed: () {
          Get.updateLocale(_getLocale(locale));
        },
        icon: const Icon(Icons.language),
      ),
      Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          Positioned(
            top: 7,
            right: 7,
            child: Container(
              width: 12,
              height: 12,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.active,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.light, width: 2),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
