import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkso/resources/palette.dart';

final _lightTextTheme = GoogleFonts.montserratTextTheme().apply(bodyColor: AppColors.darkText);
final _darkTextTheme = GoogleFonts.montserratTextTheme().apply(bodyColor: Colors.white);

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
  buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
  // colorScheme: _lightColorScheme,
);

final ThemeData darkTheme = ThemeData(
  textTheme: _darkTextTheme,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
    },
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  buttonTheme: const ButtonThemeData(buttonColor: AppColors.darkText),
  // colorScheme: _darkColorScheme,
);

const ColorScheme _lightColorScheme = ColorScheme(
  primary: AppColors.darkText,
  primaryVariant: AppColors.primaryVariant,
  secondary: Color(0xFF03DAC5),
  secondaryVariant: Color(0xFF0AE1C5),
  background: Color(0xFFE6EBEB),
  surface: Color(0xFFFAFBFB),
  onBackground: Colors.white,
  error: Colors.red,
  onError: Colors.white,
  onPrimary: Colors.white,
  onSecondary: Color(0xFF322942),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light,
);

const ColorScheme _darkColorScheme = ColorScheme(
  primary: AppColors.darkText,
  primaryVariant: AppColors.primaryVariant,
  secondary: Color(0xFF03DAC5),
  secondaryVariant: Color(0xFF0AE1C5),
  background: Color(0xFFE6EBEB),
  surface: Color(0xFFFAFBFB),
  onBackground: Colors.white,
  error: Colors.red,
  onError: Colors.white,
  onPrimary: Colors.white,
  onSecondary: Color(0xFF322942),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.dark,
);