import 'package:flutter/material.dart';
import 'package:linkso/pages/overview/widgets/info_card.dart';

class OverviewCardsMediumScreen extends StatelessWidget {
  const OverviewCardsMediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(width: _width / 64),
            InfoCard(
              title: "Links count many words",
              value: "7",
              onTap: () {},
              topColor: Colors.cyan,
            ),
            SizedBox(width: _width / 64),
            InfoCard(
              title: "ooo",
              value: "16",
              onTap: () {},
              topColor: Colors.red,
            ),
            SizedBox(width: _width / 64),
          ],
        ),
        SizedBox(height: _width / 64),
        Row(
          children: [
            SizedBox(width: _width / 64),
            InfoCard(
              title: "mmm",
              value: "15",
              onTap: () {},
              topColor: Colors.pink,
            ),
            SizedBox(width: _width / 64),
            InfoCard(
              title: "aaa",
              value: "3",
              onTap: () {},
              topColor: Colors.orangeAccent,
            ),
            SizedBox(width: _width / 64),
          ],
        )
      ],
    );
  }
}
