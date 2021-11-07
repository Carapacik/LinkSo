import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/pages/main/widgets/link_form.dart';
import 'package:linkso/pages/main/widgets/result_link.dart';
import 'package:linkso/resources/theme.dart';
import 'package:linkso/widgets/custom_card_container.dart';

class MainPageLarge extends StatelessWidget {
  const MainPageLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCardContainer(
              borderRadius: 40,
              constraints: const BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.makeYourLinkShorter,
                    style: Theme.of(context).textTheme.b24,
                  ),
                  const SizedBox(height: 20),
                  const LinkForm(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Obx(() {
              if (mainPageController.receivedLinkKey.value.isNotEmpty) {
                return const CustomCardContainer(
                  borderRadius: 40,
                  constraints: BoxConstraints(maxWidth: 600),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: ResultLink(),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ],
    );
  }
}
