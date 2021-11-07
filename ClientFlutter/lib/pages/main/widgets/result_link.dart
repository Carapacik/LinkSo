import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/resources/theme.dart';
import 'package:linkso/widgets/default_button.dart';

class ResultLink extends StatelessWidget {
  const ResultLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final fullLink = "${mainPageController.baseUri}/${mainPageController.receivedLinkKey.value}";
      return Center(
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 280,
                    child: SelectableText(
                      fullLink,
                      style: Theme.of(context).textTheme.b18.copyWith(color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DefaultButton(
                    onPressed: () {
                      FlutterClipboard.copy(fullLink);
                    },
                    text: AppLocalizations.of(context)!.copy,
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 280,
                    child: SelectableText(
                      fullLink,
                      style: Theme.of(context).textTheme.b18.copyWith(color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  const SizedBox(width: 20),
                  DefaultButton(
                    onPressed: () {
                      FlutterClipboard.copy(fullLink);
                    },
                    text: AppLocalizations.of(context)!.copy,
                  ),
                ],
              ),
      );
    });
  }
}
