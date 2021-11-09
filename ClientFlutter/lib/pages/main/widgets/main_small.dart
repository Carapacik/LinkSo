import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:linkso/resources/theme.dart';
import 'package:linkso/widgets/custom_card_container.dart';

import '../../../controller_instances.dart';
import 'link_form.dart';
import 'result_link.dart';

class MainPageSmall extends StatelessWidget {
  const MainPageSmall({Key? key}) : super(key: key);

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
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  const Center(child: SizedBox(width: 500, child: LinkForm())),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              final _key = mainPageController.receivedLinkKey.value;
              if (_key.isNotEmpty) {
                return const CustomCardContainer(
                  borderRadius: 40,
                  constraints: BoxConstraints(maxWidth: 600),
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
