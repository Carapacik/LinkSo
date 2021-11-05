import 'package:flutter/material.dart';
import 'package:linkso/pages/stat/widgets/stat_large.dart';
import 'package:linkso/pages/stat/widgets/stat_small.dart';
import 'package:linkso/widgets/custom_scaffold.dart';

class StatPage extends StatelessWidget {
  const StatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarEnabled: true,
      drawerEnabled: true,
      largeScreen: const StatPageLarge(),
      smallScreen: const StatPageSmall(),
    );
  }
}
