import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/layout.dart';
import 'package:linkso/pages/auth/auth_page.dart';
import 'package:linkso/pages/error/not_found_page.dart';
import 'package:linkso/pages/main/main_page.dart';
import 'package:linkso/routing.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: mainPageRoute,
      unknownRoute: GetPage(
        name: "/not-found",
        page: () => const NotFoundPage(),
      ),
      getPages: [
        GetPage(name: rootRoute, page: () => SiteLayout()),
        GetPage(name: authenticationPageRoute, page: () => const AuthPage()),
        GetPage(name: mainPageRoute, page: () => MainPage()),
      ],
      theme: themeController.savedThemeData(),
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru', 'RU'),
      ],
    );
  }
}
