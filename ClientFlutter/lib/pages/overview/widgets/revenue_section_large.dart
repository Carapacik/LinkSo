import 'package:flutter/material.dart';
import 'package:linkso/pages/overview/widgets/revenue_info.dart';
import 'package:linkso/resources/palette.dart';
import 'package:linkso/widgets/custom_text.dart';

class RevenueLarge extends StatelessWidget {
  const RevenueLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            color: AppColors.lightGrey.withOpacity(0.1),
            blurRadius: 12,
          )
        ],
        border: Border.all(color: AppColors.lightGrey, width: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomText(
                  text: "Revenue Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: AppColors.lightGrey,
                ),
                SizedBox(
                  width: 600,
                  height: 200,
                  // child: SimpleBarChart.withSampleData(),
                  child: Text("Chart flutter after update package"),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 120,
            color: AppColors.lightGrey,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: const [
                    RevenueInfo(title: "today rev", amount: "23"),
                    RevenueInfo(title: "last 7 days", amount: "150"),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    RevenueInfo(title: "last 30 days", amount: "1500"),
                    RevenueInfo(title: "last 12 months", amount: "30 202"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
