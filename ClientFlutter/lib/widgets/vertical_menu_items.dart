import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/resources/palette.dart';
import 'package:linkso/widgets/custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  const VerticalMenuItem({
    Key? key,
    required this.itemName,
    this.onTap,
  }) : super(key: key);

  final String itemName;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value ? menuController.onHover(itemName) : menuController.onHover("Not hover");
      },
      child: Obx(
        () => Container(
          color: menuController.isHover(itemName) ? AppColors.lightGrey.withOpacity(0.2) : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHover(itemName) || menuController.isActive(itemName),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: AppColors.dark,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: menuController.returnIconFor(itemName),
                    ),
                    if (!menuController.isActive(itemName))
                      Flexible(
                        child: CustomText(
                          text: itemName,
                          color: menuController.isHover(itemName) ? AppColors.dark : AppColors.lightGrey,
                        ),
                      )
                    else
                      Flexible(
                        child: CustomText(
                          text: itemName,
                          color: AppColors.dark,
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
