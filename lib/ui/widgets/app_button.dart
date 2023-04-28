import 'package:flutter/material.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double? textSize;
  final FontWeight? textFontWeight;
  final bool? unselected;
  final bool? showBackColor;
  final double radius;

  const AppButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.unselected = false,
      this.showBackColor = false,
      this.textSize = 16,
      this.radius = 5,
      this.textFontWeight = FontWeight.w800})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(

          elevation: const MaterialStatePropertyAll(0),
          minimumSize:
              MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
          backgroundColor: MaterialStateProperty.all<Color>(
              unselected! ? app_text_white_ffffff : app_Orange_FF7448),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(color: app_Orange_FF7448)))),
      onPressed: () {
        onTap();
      },
      child: unselected!
          ? text.appOrangeText(size: textSize, fontWeight: textFontWeight)
          : text.whiteText(size: textSize, fontWeight: textFontWeight),

    );
  }
}
// minimumSize: const Size.fromHeight(50),
