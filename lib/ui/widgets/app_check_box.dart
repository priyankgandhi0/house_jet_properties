import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

Widget appCheckBox({
  required bool value,
  required Function(bool? val) onChanged,
}) {
  return Checkbox(
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    value: value,
    onChanged: onChanged,
    activeColor: app_Orange_FF7448,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide(width: 1.0, color: app_Orange_FF7448),
    ),
  );
}
