import 'package:flutter/material.dart';
import 'package:linkso/resources/palette.dart';
import 'package:linkso/widgets/custom_text.dart';

class InfoCardSmall extends StatelessWidget {
  const InfoCardSmall({
    Key? key,
    required this.title,
    required this.value,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String value;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isActive ? AppColors.active : AppColors.lightGrey, width: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: title,
                size: 24,
                weight: FontWeight.w300,
                color: isActive ? AppColors.active : AppColors.lightGrey,
              ),
              CustomText(
                text: value,
                size: 24,
                weight: FontWeight.bold,
                color: isActive ? AppColors.active : AppColors.dark,
              )
            ],
          ),
        ),
      ),
    );
  }
}
