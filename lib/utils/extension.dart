import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

extension space on double {
  addHSpace() {
    return SizedBox(
      height: this,
    );
  }

  addWSpace() {
    return SizedBox(
      width: this,
    );
  }
}

TextStyle appTextStyleBlack500 = GoogleFonts.manrope(
    color: app_text_black_1B1B1B, fontSize: 16, fontWeight: FontWeight.w500);

TextStyle appTextStyleGrey400 = GoogleFonts.manrope(
    color: app_grey_99A7AE, fontSize: 14, fontWeight: FontWeight.w400);

extension AppText on String {
  darkText({double? size, FontWeight? fontWeight}) {
    return Text(
      this,
      style: GoogleFonts.manrope(
          color: app_text_black_1B1B1B, fontSize: size, fontWeight: fontWeight),
    );
  }

  mediumText(
      {double size = 13,
      FontWeight? fontWeight,
      Color color = Colors.black,
      TextDecoration textDecoration = TextDecoration.none}) {
    return Text(
      this,
      style: GoogleFonts.manrope(
          decoration: textDecoration,
          color: color,
          fontSize: size,
          fontWeight: fontWeight),
    );
  }

  appOrangeText(
      {double? size,
      FontWeight? fontWeight,
      bool? underLine,
      TextAlign? textAlign}) {
    return Text(
      this,
      style: GoogleFonts.manrope(
          color: app_Orange_FF7448,
          fontSize: size,
          fontWeight: fontWeight,
          decorationColor: app_Orange_FF7448,
          decoration: underLine != null
              ? underLine
                  ? TextDecoration.underline
                  : null
              : null),
      textAlign: textAlign,
    );
  }

  appOrangeText600(
      {double? size,
      FontWeight? fontWeight = FontWeight.w600,
      bool? underLine,
      TextAlign? textAlign}) {
    return Text(
      this,
      style: GoogleFonts.manrope(
          color: app_Orange_FF7448,
          fontSize: size,
          fontWeight: fontWeight,
          decorationColor: app_Orange_FF7448,
          decoration: underLine != null
              ? underLine
                  ? TextDecoration.underline
                  : null
              : null),
      textAlign: textAlign,
    );
  }

  Widget appBlackText1B1B1B({double? size, FontWeight? fontWeight}) {
    return Text(
      this,
      style: GoogleFonts.manrope(
          color: app_text_black_1B1B1B, fontSize: size, fontWeight: fontWeight),
    );
  }

  Widget appColorChangeText(
      {double? size,
      FontWeight? fontWeight,
      bool? underLine,
      TextAlign? textAlign,
      Color? color}) {
    return Text(
      this,
      style: GoogleFonts.manrope(
          color: color ?? app_Orange_FF7448,
          fontSize: size,
          fontWeight: fontWeight,
          decoration: underLine != null
              ? underLine
                  ? TextDecoration.underline
                  : null
              : null),
      textAlign: textAlign,
    );
  }

  appGreyText({double? size, FontWeight? fontWeight, int? maxLines}) {
    return Text(
      this,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: GoogleFonts.manrope(
          color: app_grey_99A7AE, fontSize: size, fontWeight: fontWeight),
    );
  }

  whiteText({double? size, FontWeight? fontWeight}) {
    return Text(
      this,
      style: GoogleFonts.manrope(
          color: app_text_white_ffffff, fontSize: size, fontWeight: fontWeight),
    );
  }
}

showModelBottomSheet(
  BuildContext context,
  Widget widget,
) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return widget;
      });
}

showAppSnackBar(String tittle, [bool button = false]) {
  return Get.showSnackbar(
    GetSnackBar(
        message: tittle,
        backgroundColor: app_Orange_FF7448,
        borderRadius: 10,
        margin: const EdgeInsets.all(8),
        duration: const Duration(seconds: 5),
        snackStyle: SnackStyle.FLOATING,
        messageText: tittle.mediumText(color: Colors.white, size: 15),
        mainButton: button
            ? TextButton(
                onPressed: () {
                  AppSettings.openAppSettings();
                },
                // child: "Setting".mediumText(
                //     color: app_Orange_FF7448, size: 16, fontWeight: FontWeight.w500),
                child: "Setting".mediumText(
                    color: Colors.white, size: 16, fontWeight: FontWeight.w500),
              )
            : null),
  );
}
