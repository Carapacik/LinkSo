import 'package:flutter/material.dart';
import 'package:linkso/resources/palette.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    this.title,
    this.value,
    this.topColor,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final String? value;
  final Color? topColor;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 136,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(offset: const Offset(0, 6), color: AppColors.lightGrey.withOpacity(.1), blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: topColor ?? AppColors.active,
                      height: 5,
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$title\n",
                      style: TextStyle(fontSize: 16, color: isActive ? AppColors.active : AppColors.lightGrey),
                    ),
                    TextSpan(
                      text: "$value",
                      style: TextStyle(fontSize: 40, color: isActive ? AppColors.active : AppColors.dark),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
