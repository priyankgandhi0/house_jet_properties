import 'package:flutter/material.dart';
import 'package:house_jet_properties/theme/app_assets.dart';

import 'package:house_jet_properties/utils/extension.dart';

import '../../../theme/app_colors.dart';

class AppListTile extends StatelessWidget {
  final String? title;
  final String? icon;
  final Function onTap;
  bool? textColor = false;

  AppListTile(
      {Key? key, this.title, this.icon, required this.onTap, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 50,
        child: ListTile(
          tileColor: app_foreground_color_F6F8FB,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(5)),
          onTap: () => onTap(),
          leading: Image.asset(height: 20, width: 20, icon!),
          horizontalTitleGap: 14,
          minLeadingWidth: 0,
          title: textColor ?? true
              ? title!.appBlackText1B1B1B(size: 14, fontWeight: FontWeight.w400)
              : title!.appOrangeText(size: 14, fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.only(left: 16, right: 19),
          trailing: Image.asset(height: 20, width: 10, arrowIcon),
        ),
      ),
    );
  }
}
