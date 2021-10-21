import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkso/resources/palette.dart';

final _lightTextTheme = GoogleFonts.montserratTextTheme().apply(bodyColor: AppColors.darkText);
final _darkTextTheme = GoogleFonts.montserratTextTheme().apply(bodyColor: AppColors.lightText);

extension TextThemeExt on TextTheme {
  TextStyle get b24 => headline2!.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      );
}

final ThemeData lightTheme = ThemeData(
  textTheme: _lightTextTheme,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
    },
  ),
  iconTheme: const IconThemeData(color: AppColors.darkText),
);

final ThemeData darkTheme = ThemeData(
  textTheme: _darkTextTheme,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
    },
  ),
  iconTheme: const IconThemeData(color: AppColors.lightText),
);
