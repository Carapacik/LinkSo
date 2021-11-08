import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/helpers/routes.dart';
import 'package:linkso/resources/theme.dart';
import 'package:url_launcher/link.dart';

import '../controller_instances.dart';

AppBar appBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  // final locale = Localizations.localeOf(context);
  //
  // Locale _getLocale(Locale l) {
  //   switch (l.languageCode) {
  //     case 'en':
  //       return const Locale('ru', 'RU');
  //     case 'ru':
  //     default:
  //       return const Locale('en', '');
  //   }
  // }

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: accountController.isAuth.value
        ? ResponsiveWidget.isSmallScreen(context)
            ? IconButton(
                onPressed: () {
                  key.currentState?.openDrawer();
                },
                splashRadius: 25,
                icon: const Icon(Icons.menu),
              )
            : const SizedBox()
        : const SizedBox(),
    actions: [
      Obx(
        () => IconButton(
          onPressed: () {
            themeController.switchTheme(context);
          },
          splashRadius: 25,
          icon: themeController.isDarkMode.value
              ? const Icon(
                  Icons.light_mode,
                  size: 22,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.dark_mode,
                  size: 22,
                  color: Color(0xFF222222), // TODO: сменить цвет обоих
                ),
        ),
      ),
      signIn(context),

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
    ],
  );
}

Widget signIn(BuildContext context) {
  if (accountController.isAuth.value) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          accountController.isAuth.value = false;
          Get.offAllNamed(mainRoute);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              AppLocalizations.of(context)!.logout,
              style: Theme.of(context).textTheme.b18,
            ),
          ),
        ),
      ),
    );
  } else {
    return Link(
      uri: Uri.parse("/signin"),
      builder: (context, followLink) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: followLink,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: Theme.of(context).textTheme.b18,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
