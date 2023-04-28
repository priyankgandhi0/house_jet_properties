import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';


class LoginController extends GetxController {
  RxBool termCheck = false.obs;
  RxBool showLoading = false.obs;
  RxBool rememberCheck = false.obs;
  TextEditingController userFirstNameController = TextEditingController();
  TextEditingController userLastNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isUserNameValid = true.obs;
  RxBool isPasswordValid = true.obs;

  @override
  void onInit() async {
    userEmailController.text =
        (preferences.getString(SharedPreference.USER_INFO))!;
    rememberCheck.value =
        (preferences.getBool(SharedPreference.REMEMBER_PASSWORD))!;
    super.onInit();
  }

  clearAllTextField() {
    userFirstNameController.clear();
    userLastNameController.clear();
    userEmailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<bool> onPop() async {
    clearAllTextField();
    return true;
  }

  /*signIn() async {
    showLoading.value = true;
    update();
    try {
      if (userNameController.text != '' &&
          passwordController.text != '' &&
          termCheck.value == true) {
        isUserNameValid.value = true;
        isPasswordValid.value = true;
        ResponseItem result;
        result = await logIn.userLogin(
            userNameController.text, passwordController.text);
        LoginModel data = LoginModel.fromMap(result.data);

        if (data.token != null) {
          showLoading.value = false;

          await preferences.putString(SharedPreference.AUTH_TOKEN, data.token!);

          await preferences.putBool(SharedPreference.IS_LOGGED_IN, true);
          if (rememberCheck.value == true) {
            await preferences.putString(
                SharedPreference.USER_INFO, userNameController.text);
            await preferences.putBool(SharedPreference.REMEMBER_PASSWORD, true);
          } else {
            await preferences.putString(SharedPreference.USER_INFO, '');
            userNameController.clear();
            await preferences.putBool(
                SharedPreference.REMEMBER_PASSWORD, false);
          }

          Get.offAllNamed(Routes.homeScreen);
        } else {
          showLoading.value = false;
          appSnachBar(
              title: 'invalid credentials',
              message: 'please enter valid username or Password');
        }
      } else {
        showLoading.value = false;
        if (userNameController.text == '') {
          isUserNameValid.value = false;
        } else {
          isUserNameValid.value = true;
        }
        if (passwordController.text == '') {
          isPasswordValid.value = false;
        } else {
          isPasswordValid.value = true;
        }
        if (termCheck.value == false) {
          appSnachBar(
              title: 'Terms & conditions',
              message: 'please agree to terms ands conditions');
        }
      }
    } catch (e) {
      showLoading.value = false;
    }

    ///
    update();
  }*/

  onCheckTerms(bool value) {
    termCheck.value = value;
    update();

  }

  onCheckRememberMe(bool value) {
    rememberCheck.value = value;
    update();
  }
}
