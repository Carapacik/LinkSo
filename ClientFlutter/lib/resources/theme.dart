import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkso/resources/palette.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.light,
  textTheme: GoogleFonts.montserratTextTheme().apply(bodyColor: Colors.black),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
    },
  ),
  iconTheme: IconThemeData(color: Colors.black),
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.dark,
  textTheme: GoogleFonts.montserratTextTheme().apply(bodyColor: Colors.white),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
    },
  ),
  iconTheme: IconThemeData(color: Colors.white),
);
