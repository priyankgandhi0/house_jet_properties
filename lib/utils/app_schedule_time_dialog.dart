import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_date_time_picker.dart';
import 'package:house_jet_properties/ui/widgets/startup_text_field.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../theme/app_colors.dart';


// Widget appDialogWithButtons(
//     {required String tittle,
//       required String description,
//       required String buttonText,
//       required Function onTap,
//       required Color buttonColor,
//       required BuildContext context,
//       bool visible = false,
//       required bool showCancelButton}) {
//   DateTime? meetingTime;
//   return
// }

class AppScheduleTimeDialog extends StatelessWidget {
  String tittle;
  String description;
  String buttonText;
  Function onTap;
  Color buttonColor;
  BuildContext context;
  bool visible;
  bool showCancelButton;
  SearchController searchController = Get.find<SearchController>();

  AppScheduleTimeDialog({Key? key,
    required this.tittle,
    required this.description,
    required this.buttonText,
    required this.onTap,
    required this.buttonColor,
    required this.context,
    this.visible = false,
    required this.showCancelButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(builder: (ctrl) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
          titlePadding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 8),
          elevation: 5.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: tittle.appOrangeText(
            size: 18,
            fontWeight: FontWeight.w600,
          ),
          content: AppTextFields(
              onTap: () async {
                DateTime? meetingTime = await AppDateTimePicker
                    .showDateAndTimePicker(
                    context, DateTime.now());
                if(meetingTime != null){
                  ctrl.scheduleTimeCtr.text = meetingTime.appDateTimeFormat();

                }

                 ctrl.update();
              },
              readOnly: true,
              controller: ctrl.scheduleTimeCtr,
              hintText: "request a showing",
              maxLine: 1,
              hintStyle: GoogleFonts.manrope(
                  color: app_grey_99A7AE,
                  fontWeight: FontWeight.w400,
                  fontSize: 14)),
          // content: Text(
          //   description,
          // ),
          actionsPadding: const EdgeInsetsDirectional.only(end: 8),
          actions: <Widget>[
            TextButton(

                child:
                buttonText.appOrangeText(size: 16, fontWeight: FontWeight.w400),
                onPressed: () {
                  onTap();
                }),
            Visibility(
              visible: showCancelButton,
              child: TextButton(
                  child: "No"
                      .appBlackText1B1B1B(
                      size: 16, fontWeight: FontWeight.w400),
                  onPressed: () {

                    Get.back();
                  }),
            )
          ],
        ),
      );
    });
  }
}

