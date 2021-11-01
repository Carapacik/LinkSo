import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/pages/main/widgets/main_large.dart';
import 'package:linkso/pages/main/widgets/main_small.dart';
import 'package:linkso/resources/theme.dart';
import 'package:linkso/widgets/custom_scaffold.dart';
import 'package:linkso/widgets/default_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarEnabled: true,
      drawerEnabled: true,
      largeScreen: const MainPageLarge(),
      smallScreen: const MainPageSmall(),
    );
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: MainPageLarge(),
      smallScreen: MainPageSmall(),
    );
  }
}

class _ResultLink extends StatelessWidget {
  const _ResultLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final _key = linkController.receivedLinkKey.value;
      if (_key.isNotEmpty) {
        final fullLink = "${linkController.baseUri}/$_key";
        return Center(
          child: ResponsiveWidget.isSmallScreen(context)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
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
      } else {
        return const SizedBox();
      }
    });
  }
}
