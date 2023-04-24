import 'package:flutter/material.dart';
import 'package:house_jet_properties/utils/extension.dart';
import '../../../theme/app_colors.dart';

class PropertiesDetailesText extends StatelessWidget {
  PropertiesDetailesText({Key? key, required this.title, required this.desc})
      : super(key: key);
  String title;
  String desc;
  double width = 140;
  @override
  Widget build(BuildContext context) {
    return Row(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title.mediumText(fontWeight: FontWeight.bold, size: 15),
              ":".mediumText(fontWeight: FontWeight.bold, size: 15),
            ],
          ),
        ),
        Expanded(

          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: desc.mediumText(
                fontWeight: FontWeight.w700,
                color: app_text_black_343434,
                size: 14),
          ),
        )
      ],
    );
  }
}
