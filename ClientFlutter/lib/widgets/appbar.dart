import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/resources/palette.dart';
import 'package:linkso/resources/theme.dart';
import 'package:url_launcher/link.dart';

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
        ? null
        : IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              key.currentState?.openDrawer();
            },
          ),
    actions: [
      Obx(
        () => IconButton(
          onPressed: () {
            themeController.switchTheme(context);
          },
          icon: themeController.isDarkMode.value
              ? const Icon(
                  Icons.light_mode,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.dark_mode,
                  color: AppColors.darkText,
                ),
        ),
      ),
      Link(
        uri: Uri.parse("/auth"),
        builder: (context, followLink) {
          return TextButton(
            onPressed: followLink,
            child: Text(
              AppLocalizations.of(context)!.login,
              style: Theme.of(context).textTheme.n14,
            ),
          );
        },
      ),

      // IconButton(
      //   onPressed: () {
      //     Get.updateLocale(_getLocale(locale));
      //   },
      //   icon: const Icon(Icons.language),
      // ),
      // Stack(
      //   children: [
      //     Center(
      //       child: IconButton(
      //         onPressed: () {},
      //         icon: const Icon(Icons.notifications),
      //       ),
      //     ),
      //     Positioned(
      //       top: 12,
      //       right: 7,
      //       child: Container(
      //         width: 10,
      //         height: 10,
      //         decoration: const BoxDecoration(
      //           color: Colors.red,
      //           shape: BoxShape.circle,
      //         ),
      //       ),
      //     )
      //   ],
      // ),

      // Сделать тут Login и logout справа сверху
    ],
  );
}
