import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/resources/palette.dart';
import 'package:linkso/routing.dart';
import 'package:linkso/widgets/custom_text.dart';
import 'package:linkso/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.red,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text("SO"),
                    ),
                    const Flexible(child: CustomText(text: "Link")),
                    SizedBox(width: _width / 48),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 40),
          Divider(color: AppColors.lightGrey.withOpacity(0.1)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map(
                  (item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      if (item.route == authenticationPageRoute) {
                        menuController.activeItem.value = overviewPageDisplayName;
                        Get.offAllNamed(authenticationPageRoute);
                      }

                      if (!menuController.isActive(item.name)) {
                        menuController.activeItem.value = item.name;
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        navigationController.navigateTo(item.route);
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
