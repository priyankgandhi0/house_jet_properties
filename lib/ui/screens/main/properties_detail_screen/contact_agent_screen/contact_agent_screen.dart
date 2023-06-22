import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/ui/widgets/app_date_time_picker.dart';
import 'package:house_jet_properties/ui/widgets/startup_text_field.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../../../theme/app_colors.dart';
import 'contact_agent_controller.dart';

class ContactAgentScreen extends StatelessWidget {
  ContactAgentController contractAgentCtr = Get.put(ContactAgentController());

  ContactAgentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactAgentController>(builder: (ctrl) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  onTap: () {},
                  text: "SUBMIT",
                  radius: 30,
                  textFontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Scaffold(

            backgroundColor: Colors.transparent,
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              elevation: 5,
              bottomOpacity: 1.0,
              centerTitle: true,
              toolbarHeight: 80,
              shadowColor: Colors.grey.withOpacity(0.15),
              bottom: PreferredSize(
                preferredSize: Size.zero,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            onTap: () => Get.back(),
                            child: Image.asset(backArrowIcon, height: 16),
                          ),
                        ),
                      ),
                      "Contact an Agent".darkText(size: 20, fontWeight: FontWeight.w700),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    (20.0).addHSpace(),

                    " Full Name".appBlackText1B1B1B(
                        size: 14, fontWeight: FontWeight.w400),

                    (10.0).addHSpace(),

                    AppTextFields(
                        controller: TextEditingController(),
                        hintText: "Enter Name",
                        hintStyle: GoogleFonts.manrope(
                            color: app_grey_99A7AE,
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                    (15.0).addHSpace(),

                    " Email Address".appBlackText1B1B1B(
                        size: 14, fontWeight: FontWeight.w400),

                    (10.0).addHSpace(),

                    AppTextFields(
                        controller: TextEditingController(),
                        hintText: "Enter Email",
                        hintStyle: GoogleFonts.manrope(
                            color: app_grey_99A7AE,
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                    (15.0).addHSpace(),

                    " Phone Number".appBlackText1B1B1B(
                        size: 14, fontWeight: FontWeight.w400),

                    (10.0).addHSpace(),

                    AppTextFields(
                        controller: TextEditingController(),
                        hintText: "Enter Number",
                        hintStyle: GoogleFonts.manrope(
                            color: app_grey_99A7AE,
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                    (15.0).addHSpace(),

                    " Message".appBlackText1B1B1B(
                        size: 14, fontWeight: FontWeight.w400),
                    (10.0).addHSpace(),

                    AppTextFields(
                        controller: TextEditingController(),
                        hintText: "Type Something.....",
                        maxLine: 5,
                        hintStyle: GoogleFonts.manrope(
                            color: app_grey_99A7AE,
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),

                    AppTextFields(

                        onTap: () async{
                         DateTime? meetingTime = await AppDateTimePicker
                              .showDateAndTimePicker(
                              context,DateTime.now());
                         if(meetingTime != null){
                           ctrl.scheduleTimeCtr.text = meetingTime.appDateTimeFormat();
                         }
                          ctrl.update();
                        },
                        readOnly: true,
                        controller:ctrl.scheduleTimeCtr,
                        hintText: "Select Meeting Time",
                        maxLine: 1,

                        hintStyle: GoogleFonts.manrope(

                            color: app_grey_99A7AE,
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
