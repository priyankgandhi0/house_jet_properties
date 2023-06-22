import 'package:flutter/cupertino.dart';

import 'package:house_jet_properties/utils/extension.dart';

import '../../../theme/app_colors.dart';

Widget homeTypeCard({
  required Color? iconColor,
  required Color? textColor,
  required Color? borderColor,
  required String iconName,
  required String subtitleText,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: app_back_grey_F5F8FB,
          border: Border.all(color: borderColor ?? app_back_grey_F5F8FB),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconName,
            height: 24,
            color: iconColor,
          ),
          (10.0).addHSpace(),
          subtitleText.appColorChangeText(
              size: 12, fontWeight: FontWeight.w400, color: textColor),
        ],
      ),
    ),
  );
}

Widget homeTypeTextCard({
  required Color? borderColor,
  required Widget child,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,

    child: Container(
      decoration: BoxDecoration(
          color: app_back_grey_F5F8FB,
          border: Border.all(color: borderColor ?? app_back_grey_F5F8FB),
          borderRadius: BorderRadius.circular(6)),
      child: child,
    ),
  );
}
