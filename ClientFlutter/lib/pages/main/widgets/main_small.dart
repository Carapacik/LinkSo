import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:linkso/pages/main/widgets/link_form.dart';
import 'package:linkso/resources/theme.dart';

class MainPageSmall extends StatelessWidget {
  const MainPageSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlassmorphicContainer(
            width: double.infinity,
            height: 250,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            borderRadius: 40,
            blur: 20,
            border: 1,
            alignment: Alignment.center,
            linearGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.3),
              ],
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.2),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.makeYourLinkShorter,
                    style: Theme.of(context).textTheme.b24,
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: SizedBox(
                      width: 400,
                      child: LinkForm(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
