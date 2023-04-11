import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/screens/main/profile_screen/change_password/change_password_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/ui/widgets/startup_text_field.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../../../theme/app_colors.dart';


class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  final ChangePasswordController loginController =
  Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                      onTap: () => Get.back(),
                      child: Image.asset(backArrowIcon, height: 16),
                    ),
                  ),
                ),
                "Change Password"
                    .darkText(size: 20, fontWeight: FontWeight.w700),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<ChangePasswordController>(
        builder: (ctrl) =>
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  20.0.addHSpace(),
                  AppTextFields(

                      controller: ctrl.oldPassword,
                      hintText: "Old Password",
                      hintStyle: GoogleFonts.manrope(
                          color: app_grey_99A7AE,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                  15.0.addHSpace(),
                  AppTextFields(
                      controller: ctrl.newPassword,
                      hintText: "New Password",
                      hintStyle: GoogleFonts.manrope(
                          color: app_grey_99A7AE,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                  15.0.addHSpace(),
                  AppTextFields(
                      controller: ctrl.confirmNewPassword,
                      hintText: "Re-enter Password",
                      hintStyle: GoogleFonts.manrope(
                          color: app_grey_99A7AE,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                  50.0.addHSpace(),
                  AppButton(
                    onTap: () {
                      if (ctrl.oldPassword.text
                          .trim()
                          .isEmpty) {
                        showAppSnackBar("Enter old password");
                      } else if (ctrl.newPassword.text
                          .trim()
                          .isEmpty) {
                        showAppSnackBar("Enter new password");
                      } else if (ctrl.confirmNewPassword.text
                          .trim()
                          .isEmpty) {
                        showAppSnackBar("Enter confirm new password");
                      } else if (ctrl.newPassword.text.trim() !=
                          ctrl.confirmNewPassword.text.trim()) {
                        showAppSnackBar(
                            "New password and confirm new password doesn't match");
                      } else {
                        Get.back();
                        ctrl.clearTextFiled();
                        showAppSnackBar("Password change success");
                      }
                    },
                    text: "CHANGE",
                    radius: 30,
                    textFontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
      ),
    );
  }
}
