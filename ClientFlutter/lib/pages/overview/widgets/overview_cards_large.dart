import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linkso/pages/overview/widgets/info_card.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  const OverviewCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        InfoCard(
          title: "Links",
          value: "7",
          onTap: () {},
          topColor: Colors.cyan,
        ),
        SizedBox(width: _width / 64),
        InfoCard(
          title: "Redirect",
          value: "70",
          onTap: () {},
          topColor: Colors.red,
        ),
        SizedBox(width: _width / 64),
        InfoCard(
          title: "Stat1",
          value: "1",
          onTap: () {},
          topColor: Colors.pink,
        ),
        SizedBox(width: _width / 64),
        InfoCard(
          title: "Stat2",
          value: "1",
          onTap: () {},
          topColor: Colors.orangeAccent,
        ),
        SizedBox(width: _width / 64),
      ],
    );
  }
}
