import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkso/layout.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          },
        ),
      ),
      home: SiteLayout(),
    );
  }
}
