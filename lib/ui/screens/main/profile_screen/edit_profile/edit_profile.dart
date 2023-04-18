import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/screens/main/profile_screen/edit_profile/edit_profile_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/ui/widgets/startup_text_field.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../../../theme/app_colors.dart';


class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  final EditProfileController editProfileController =
  Get.put(EditProfileController());

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
                "My Profile".darkText(size: 20, fontWeight: FontWeight.w700),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<EditProfileController>(
        builder: (ctrl) =>
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    35.0.addHSpace(),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(

                              image: DecorationImage(


                                image: AssetImage(profileDashedIcon),


                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),

                              /*child: ctrl.profileImage == null
                              ? Image.asset(userProfileImage)
                              : Image.file(ctrl.profileImage!),
                            */
                              child: CircleAvatar(
                                backgroundImage: ctrl.profileImage == null
                                    ? Image
                                    .asset(userProfileImage)
                                    .image
                                    : Image
                                    .file(ctrl.profileImage!,
                                    fit: BoxFit.fill)
                                    .image,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(

                            overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                            onTap: () {
                              ctrl.pickImage(context);
                            },
                            child: Image.asset(
                              cameraImage,
                              height: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                    55.0.addHSpace(),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextFields(
                              controller: ctrl.userFirstName,
                              hintText: "First Name",
                              hintStyle: GoogleFonts.manrope(
                                  color: app_grey_99A7AE,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ),
                        20.0.addWSpace(),
                        Expanded(
                          child: AppTextFields(
                              controller: ctrl.userLastName,
                              hintText: "Last Name",
                              hintStyle: GoogleFonts.manrope(
                                  color: app_grey_99A7AE,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        )
                      ],
                    ),
                    (30.0).addHSpace(),
                    AppTextFields(
                        controller: ctrl.userEmail,
                        readOnly: true,
                        shoeCursor: false,
                        hintText: "Email Address",
                        hintStyle: GoogleFonts.manrope(
                            color: app_grey_99A7AE,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    60.0.addHSpace(),
                    AppButton(
                      onTap: () {
                        if (ctrl.userFirstName.text
                            .trim()
                            .isEmpty) {
                          showAppSnackBar("Enter First Name");
                        }
                        else if (ctrl.userLastName.text
                            .trim()
                            .isEmpty) {
                          showAppSnackBar("Enter Last Name");
                        }
                        else {

                          Get.back();
                          showAppSnackBar("Profile update Success");
                        }
                      },
                      text: "SAVE CHANGE",
                      radius: 30,
                      textFontWeight: FontWeight.w600,
                    ),
                    10.0.addHSpace()
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
