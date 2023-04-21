import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../theme/app_assets.dart';
import '../../theme/app_colors.dart';

class AppExpansionTile extends StatelessWidget {
  BuildContext context;
  bool isExpanded;
  Function(bool) onExpansionChanged;
  Widget tileTileWidget;
  List<Widget> childrenWidgetList;

  AppExpansionTile({
    Key? key,
    required this.context,
    required this.isExpanded,
    required this.onExpansionChanged,
    required this.tileTileWidget,
    required this.childrenWidgetList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(

      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.only(left: 16, right: 16),
        childrenPadding: const EdgeInsets.only(left: 4, right: 4),
        trailing: isExpanded
            ? Image.asset(
                icArrowUpIcon,
                color: app_Orange_FF7448,
                height: 23,
                width: 13,
              ).paddingOnly(right: 8)
            : Image.asset(
                icArrowDownIcon,
                color: app_Orange_FF7448,
                height: 23,
                width: 13,
              ).paddingOnly(right: 8),

        initiallyExpanded: isExpanded,
        onExpansionChanged: onExpansionChanged,
        title: tileTileWidget,
        // Text(
        //   "Gartenpflege",
        //   style: AppTextStyle.regular.copyWith(fontSize: 18, color: AppColors.blackColor),
        // ),
        children: childrenWidgetList,
      ),
    );
  }
}

// Widget appExpansionTile({
//   required BuildContext context,
//   required bool isExpanded,
//   required Function(bool) onExpansionChanged,
//   required Widget tileTileWidget,
//   required List<Widget> childrenWidgetList,
// }) {
//   return
// }

Widget appCupertinoPicker({
  required Widget selectionOverlayWidget,
  required List<Widget> childrenList,
  required Function(int) onSelectedItemChanged,
}) {
  return CupertinoPicker(
    itemExtent: 50,
    selectionOverlay: selectionOverlayWidget,

    //     CupertinoPickerDefaultSelectionOverlay(
    //   background: app_Orange_FF7448.withOpacity(0.2),
    // ),
    onSelectedItemChanged: (int index) {
      onSelectedItemChanged(index);
    },
    children: childrenList,
  );
}
