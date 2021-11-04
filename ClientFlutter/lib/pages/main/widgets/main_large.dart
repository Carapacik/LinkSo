import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/pages/main/widgets/link_form.dart';
import 'package:linkso/pages/main/widgets/result_link.dart';
import 'package:linkso/resources/theme.dart';

class MainPageLarge extends StatelessWidget {
  const MainPageLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GlassmorphicContainer(
                width: 600,
                height: 200,
                borderRadius: 40,
                blur: 20,
                border: 1,
                alignment: Alignment.center,
                linearGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.4),
                  ],
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.makeYourLinkShorter,
                        style: Theme.of(context).textTheme.b24,
                      ),
                      const SizedBox(height: 30),
                      const LinkForm(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Obx(() {
                final _key = linkController.receivedLinkKey.value;

                if (_key.isNotEmpty) {
                  return GlassmorphicContainer(
                    width: 600,
                    height: 150,
                    borderRadius: 40,
                    blur: 20,
                    border: 1,
                    alignment: Alignment.center,
                    linearGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.4),
                      ],
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: ResultLink(),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ],
    );
  }
}
