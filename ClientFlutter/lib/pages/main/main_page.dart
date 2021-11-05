import 'package:flutter/material.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/pages/main/widgets/main_large.dart';
import 'package:linkso/pages/main/widgets/main_small.dart';
import 'package:linkso/widgets/custom_scaffold.dart';

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
