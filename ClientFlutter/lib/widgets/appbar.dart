import 'package:flutter/material.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/resources/palette.dart';
import 'package:linkso/widgets/custom_text.dart';

AppBar topNav(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
      backgroundColor: AppColors.light,
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: const Text("SO", style: TextStyle(color: Colors.black)),
                )
              ],
            )
          : IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                key.currentState?.openDrawer();
                print("aboba");
              },
            ),
      elevation: 0,
      title: Row(
        children: [
          const Visibility(child: CustomText(text: "LinkSO")),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: AppColors.dark.withOpacity(0.6),
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: AppColors.dark.withOpacity(0.6),
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.active,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.light, width: 2),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
