import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/constants/request_const.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/ui/widgets/app_loader.dart';
import 'package:house_jet_properties/ui/widgets/startup_text_field.dart';
import 'package:house_jet_properties/utils/app_routes.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../../Theme/app_colors.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var loginKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: loginKey,
          child: GetBuilder<LoginController>(
            builder: (ctrl) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/ic_logo.png",
                          height: 145,
                          width: 150,
                        ).paddingOnly(top: 40, bottom: 25),
                        // .paddingOnly(
                        // left: 99.0, right: 99, top: 90, bottom: 50),
                        'Welcome Back!'
                            .appOrangeText(size: 30, fontWeight: FontWeight.w600),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 50),
                          child: 'Sign In to continue'
                              .appGreyText(size: 14, fontWeight: FontWeight.w500),
                        ),

                        AppTextFields(
                          controller: ctrl.userEmailController,
                          hintText: 'Enter Email',
                          isSecureEntry: false,
                          validator: (val){
                            if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(ctrl.userEmailController.text)) {
                              return  "Enter valid email";
                            }
                            return null;
                          },

                        ),

                        (40.0).addHSpace(),

                        AppTextFields(
                          controller: ctrl.passwordController,
                          hintText: "Enter Mobile No",
                          validator: (val){
                            if (ctrl.passwordController.text.trim().isEmpty) {
                              return  "Enter valid password";
                            }
                            return null;
                          },
                          isSecureEntry: true,
                        ),
                        (30.0).addHSpace(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              onTap: () {
                                ctrl.onCheckTerms(!ctrl.termCheck.value);
                              },
                              child: Row(
                                children: [
                                  Checkbox(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: ctrl.termCheck.value,
                                    onChanged: (value) {
                                      ctrl.onCheckTerms(value!);
                                    },
                                    activeColor: app_Orange_FF7448,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(
                                          width: 1.0, color: app_Orange_FF7448),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'I agree to the ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: app_text_black_1B1B1B,
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: 'Terms of Service',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: app_Orange_FF7448,
                                            fontWeight: FontWeight.w400))
                                  ])),
                                ],
                              ),
                            ),
                            (20.0).addHSpace(),
                            InkWell(
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              onTap: () {
                                ctrl.onCheckRememberMe(!ctrl.rememberCheck.value);
                              },
                              child: Row(
                                children: [
                                  Checkbox(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: ctrl.rememberCheck.value,
                                    onChanged: (value) {
                                      ctrl.onCheckRememberMe(value!);
                                    },
                                    activeColor: app_Orange_FF7448,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(
                                          width: 1.0, color: app_Orange_FF7448),
                                    ),
                                  ),
                                  'Remember me'.appBlackText1B1B1B(
                                      size: 12, fontWeight: FontWeight.w400)
                                ],
                              ),
                            )
                          ],
                        ),
                        (50.0).addHSpace(),
                        AppButton(
                          text: 'SIGN IN',
                          onTap: () {
                            // printData(tittle: 'tittle');
                            // ctrl.signIn();

                            if (hasInternet.value) {

                              if(loginKey.currentState!.validate()){
                                ctrl.signIn();
                              }
                            } else {
                              showAppSnackBar("Internet connection is required");
                            }


                          },
                        ),
                        (30.0).addHSpace(),
                        InkWell(
                          onTap: () {
                            // Get.toNamed(Routes.forgotPasswordScreen);
                            primaryFocus?.unfocus();
                            ctrl.clearAllTextField();
                            Get.toNamed(Routes.forgotPasswordScreen);
                          },
                          child: 'Forgot Password?'.appOrangeText(
                              size: 16,
                              fontWeight: FontWeight.w600,
                              underLine: true),
                        ),
                        (30.0).addHSpace(),
                        InkWell(
                          overlayColor:
                              const MaterialStatePropertyAll(Colors.transparent),
                          onTap: () {
                            primaryFocus?.unfocus();
                            ctrl.clearAllTextField();
                            Get.toNamed(Routes.signUpScreen);
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: app_text_black_1B1B1B,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: app_Orange_FF7448,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                        (20.0).addHSpace(),
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
