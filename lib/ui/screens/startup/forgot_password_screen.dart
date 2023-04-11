import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/ui/screens/startup/login_screen/login_controller.dart';
import 'package:house_jet_properties/ui/screens/startup/login_screen/login_screen.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/ui/widgets/startup_text_field.dart';
import 'package:house_jet_properties/utils/extension.dart';
import '../../../../Theme/app_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => loginController.onPop(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Image.asset("assets/icons/ic_logo.png")
                    .paddingOnly(left: 99.0, right: 99, top: 90, bottom: 52),
                'Forgot Password'
                    .appOrangeText(size: 30, fontWeight: FontWeight.w600),
                10.0.addHSpace(),
                'Enter your email to reset your password'.appGreyText(
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
                50.0.addHSpace(),
                AppTextFields(
                  controller: loginController.userEmailController,
                  hintText: 'Email',
                  isSecureEntry: false,
                ),
                50.0.addHSpace(),
                AppButton(
                  text: 'REQUEST',
                  onTap: () {
                    // Get.toNamed(Routes.homeScreen);
                    if (loginController.userEmailController.text
                        .trim()
                        .isEmpty) {
                      showAppSnackBar("Enter Email");
                    } else {
                      loginController.clearAllTextField();
                      Get.offAll(LoginScreen());
                    }
                  },
                ),
                30.0.addHSpace(),
                InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.back();
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Remember password? ',
                            style: TextStyle(
                                fontSize: 14,
                                color: app_text_black_1B1B1B,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                              fontSize: 14,
                              color: app_Orange_FF7448,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                10.0.addHSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
