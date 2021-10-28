import 'package:flutter/material.dart';
import 'package:linkso/resources/palette.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: _getBackgroundGradient(Theme.of(context))),
      child: child,
    );
  }

  LinearGradient _getBackgroundGradient(ThemeData themeData) {
    if (themeData.brightness == Brightness.light) {
      return AppColors.lightGradient;
    } else {
      return AppColors.darkGradient;
    }
  }
}
