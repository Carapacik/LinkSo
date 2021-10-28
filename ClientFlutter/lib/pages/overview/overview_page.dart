import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/pages/overview/widgets/overview_cards_large.dart';
import 'package:linkso/pages/overview/widgets/overview_cards_medium.dart';
import 'package:linkso/pages/overview/widgets/overview_cards_small.dart';
import 'package:linkso/pages/overview/widgets/revenue_section_large.dart';
import 'package:linkso/pages/overview/widgets/revenue_section_small.dart';
import 'package:linkso/widgets/custom_text.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  const OverviewCardsMediumScreen()
                else
                  const OverviewCardsLargeScreen()
              else
                const OverviewCardsSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context)) const RevenueLarge() else const RevenueSmall(),
              // const DataTable2SimpleDemo(),
            ],
          ),
        ),
      ],
    );
  }
}
