import 'package:flutter/material.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/pages/overview/widgets/overview_cards_large.dart';
import 'package:linkso/pages/overview/widgets/overview_cards_medium.dart';
import 'package:linkso/pages/overview/widgets/overview_cards_small.dart';
import 'package:linkso/pages/overview/widgets/revenue_section_large.dart';
import 'package:linkso/pages/overview/widgets/revenue_section_small.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context))
          if (ResponsiveWidget.isCustomSize(context)) const OverviewCardsMediumScreen() else const OverviewCardsLargeScreen()
        else
          const OverviewCardsSmallScreen(),
        if (!ResponsiveWidget.isSmallScreen(context)) const RevenueLarge() else const RevenueSmall(),
      ],
    );
  }
}
