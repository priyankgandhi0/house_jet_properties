import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/ui/widgets/app_loader.dart';
import 'package:house_jet_properties/ui/widgets/startup_text_field.dart';
import 'package:house_jet_properties/utils/app_routes.dart';
import 'package:house_jet_properties/utils/extension.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';
import '../../../../Theme/app_colors.dart';

import '../../../../Theme/app_colors.dart';
import '../login_screen/login_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => loginController.onPop(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: GetBuilder<LoginController>(
            builder: (ctrl) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        Image.asset("assets/icons/ic_logo.png",height: 145,width: 150,).paddingOnly(top: 40,bottom: 25),
                        // Image.asset("assets/icons/ic_logo.png").paddingOnly(
                        //     left: 99.0, right: 99, top: 90, bottom: 50),
                        'Welcome Back!'.appOrangeText(
                            size: 30, fontWeight: FontWeight.w600),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 50),
                          child: 'Sign Up to continue'.appGreyText(
                              size: 14, fontWeight: FontWeight.w500),
                        ),
                        if (!ctrl.isUserNameValid.value) ...[
                          Align(
                            alignment: Alignment.topRight,
                            child: 'please enter valid UserName'
                                .appOrangeText(size: 14),
                          ),
                          4.0.addHSpace(),
                        ],
                        Row(
                          children: [
                            Expanded(
                              child: AppTextFields(
                                controller: ctrl.userFirstNameController,
                                hintText: 'First Name',
                                isSecureEntry: false,
                              ),
                            ),
                            20.0.addWSpace(),
                            Expanded(
                              child: AppTextFields(
                                controller: ctrl.userLastNameController,
                                hintText: 'Last Name',
                                isSecureEntry: false,
                              ),
                            ),
                          ],
                        ),
                        30.0.addHSpace(),
                        AppTextFields(
                          controller: ctrl.userEmailController,
                          hintText: 'Enter Email',
                          isSecureEntry: false,
                        ),
                        30.0.addHSpace(),
                        if (!ctrl.isPasswordValid.value) ...[
                          Align(
                            alignment: Alignment.topRight,
                            child: 'please enter valid Mobile No.'
                                .appOrangeText(size: 14),
                          ),
                          4.0.addHSpace(),
                        ],
                        AppTextFields(
                          controller: ctrl.passwordController,
                          hintText: 'Enter Mobile No',
                          isSecureEntry: false,
                        ),

                        // AppTextFields(
                        //   controller: ctrl.passwordController,
                        //   hintText: 'Passsword',
                        //   isSecureEntry: true,
                        // ),
                        // 30.0.addHSpace(),
                        // AppTextFields(
                        //   controller: ctrl.confirmPasswordController,
                        //   hintText: 'Confirm Password ',
                        //   isSecureEntry: true,
                        // ),
                        60.0.addHSpace(),
                        AppButton(
                          text: 'SIGN UP',
                          onTap: () {
                            if (ctrl.userFirstNameController.text.trim().isEmpty) {
                              showAppSnackBar("Please Enter First Name");
                            } else if (ctrl.userLastNameController.text
                                .trim()
                                .isEmpty) {
                              // showAppSnackBar("Please Enter Password");
                              showAppSnackBar("Please Enter Last Name");
                            } else if(ctrl.userEmailController.text
                                .trim()
                                .isEmpty){
                              showAppSnackBar("Please Enter Email");
                              // Get.off(() => HomeScreen());
                            } else if(ctrl.passwordController.text
                                .trim()
                                .isEmpty){
                              showAppSnackBar("Please Enter Mobile No");
                              // Get.off(() => HomeScreen());
                            }
                            else{
                              preferences.putBool(
                                  SharedPreference.IS_LOGGED_IN, true);
                              preferences.putString(
                                  SharedPreference.USER_EMAIL, ctrl.userEmailController.text);
                              Get.offAndToNamed(Routes.propertyDetailScreen);
                            }
                            // printData(tittle: 'tittle');

                          },
                        ),
                        (30.0).addHSpace(),
                        InkWell(
                          overlayColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          onTap: () {
                            primaryFocus?.unfocus();
                            loginController.clearAllTextField();
                            Get.back();
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Have an account? ',
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
                        20.0.addHSpace(),
                      ],
                    ),
                  ),
                  AppLoader(visible: ctrl.showLoading.value),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
