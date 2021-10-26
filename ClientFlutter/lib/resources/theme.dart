import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkso/resources/palette.dart';

final _lightTextTheme = GoogleFonts.montserratTextTheme().apply(bodyColor: AppColors.darkText);
final _darkTextTheme = GoogleFonts.montserratTextTheme().apply(bodyColor: Colors.white);

extension TextThemeExt on TextTheme {
  TextStyle get b24 => bodyText1!.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        letterSpacing: 0.5,
      );

  TextStyle get n14 => bodyText2!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      );
}

final ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: _lightTextTheme,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
    },
  ),
  iconTheme: const IconThemeData(color: AppColors.darkText),
  textSelectionTheme: TextSelectionThemeData(selectionColor: _lightColorScheme.onSecondary),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.dark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onSurface: Colors.red,
    ),
  ),
  backgroundColor: Colors.white,
  colorScheme: _lightColorScheme,
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: _darkTextTheme,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
    },
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  textSelectionTheme: TextSelectionThemeData(selectionColor: _darkColorScheme.onSecondary),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
  backgroundColor: Colors.black,
  colorScheme: _darkColorScheme,
);

const ColorScheme _lightColorScheme = ColorScheme(
  primary: AppColors.darkText,
  primaryVariant: AppColors.primaryVariant,
  secondary: Colors.white,
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
  secondary: AppColors.darkText,
  secondaryVariant: Color(0xFF0AE1C5),
  background: Color(0xFFE6EBEB),
  surface: Colors.red,
  onBackground: Colors.red,
  error: Colors.red,
  onError: Colors.white,
  onPrimary: Colors.red,
  onSecondary: Color(0xFF322942),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.dark,
);
