import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:house_jet_properties/utils/extension.dart';
import '../../theme/app_assets.dart';

PreferredSizeWidget appHeaderBar({
  required String titleText,
  Function()? leadingOnTap,
  Function()? actionOnTap,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 5,
    bottomOpacity: 1.0,
    centerTitle: true,
    toolbarHeight: 80,
    shadowColor: Colors.grey.withOpacity(0.15),
    leading: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          onTap: leadingOnTap,
          child: SizedBox(
              height: 20,
              width: 50,
              child: Image.asset(backArrowIcon, height: 16)),
        ),
      ),
    ),
    title: "$titleText".darkText(size: 20, fontWeight: FontWeight.w700),
    bottom: bottom,
    backgroundColor: Colors.white,
  );
}
