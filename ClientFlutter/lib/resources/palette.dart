import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppColors {
  AppColors._();

  static const lightPrimary = Color(0xFF4527A0);
  static const lightPrimaryVariant = Color(0xFF673AB7);
  static const lightSecondary = Color(0xFF0091EA);
  static const lightSecondaryVariant = Color(0xFF00B0FF);
  static const lightBackground = Color(0xFFF2F0F7);
  static const lightSurface = Color(0xFFFBFAFD);
  static const lightError = Color(0xFFB00020);
  static const lightOnPrimary = Color(0xFFFFFFFF);
  static const lightOnSecondary = Color(0xFFFFFFFF);
  static const lightOnBackground = Color(0xFF000000);
  static const lightOnSurface = Color(0xFF000000);
  static const lightOnError = Color(0xFFFFFFFF);

  static const darkPrimary = Color(0xFF7C67BC);
  static const darkPrimaryVariant = Color(0xFF9474CC);
  static const darkSecondary = Color(0xFF4CB1F0);
  static const darkSecondaryVariant = Color(0xFF4CC7FF);
  static const darkBackground = Color(0xFF1B1922);
  static const darkSurface = Color(0xFF17161B);
  static const darkError = Color(0xFFCF6679);
  static const darkOnPrimary = Color(0xFFFFFFFF);
  static const darkOnSecondary = Color(0xFF000000);
  static const darkOnBackground = Color(0xFFFFFFFF);
  static const darkOnSurface = Color(0xFFFFFFFF);
  static const darkOnError = Color(0xFFFFFFFF);

  static const light = Color(0xFFF7F8FC);
  static const lightGrey = Color(0xFFA4A6B3);
  static const dark = Color(0xFF262626);
  static const active = Color(0xFF3C19C0);

  static const g5 = Color(0xFF463DBC);
  static const g6 = Color(0xFF5F49A3);
  static const g7 = Color(0xFF6A568B);
  static const g8 = Color(0xFF6C6475);

  static const darkGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      darkBackground,
      darkSurface,
    ],
  );
  static const lightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      g5,
      g6,
      g7,
      g8,
    ],
  );
}
