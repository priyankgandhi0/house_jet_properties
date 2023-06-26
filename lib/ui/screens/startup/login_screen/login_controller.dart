import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/api/repositories/auth_repo.dart';
import 'package:house_jet_properties/models/login_model.dart';
import 'package:house_jet_properties/models/response_item_model/response_item.dart';
import 'package:house_jet_properties/ui/widgets/app_snackbar.dart';
import 'package:house_jet_properties/utils/app_routes.dart';
import 'package:house_jet_properties/utils/extension.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';


class LoginController extends GetxController {
  RxBool termCheck = false.obs;
  RxBool showLoading = false.obs;
  RxBool rememberCheck = false.obs;
  TextEditingController userFirstNameController = TextEditingController();
  TextEditingController userLastNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



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

  }

  Future<bool> onPop() async {
    clearAllTextField();
    return true;
  }

  signIn() async {
    if (termCheck.value == false) {
      appSnachBar(
          title: 'Terms & conditions',
          message: 'please agree to terms ands conditions');
      return null;
    }
    showLoading.value = true;
    update();
    try {
        ResponseItem result;
        result = await logIn.userLogin(
            userEmailController.text, passwordController.text);
        LoginModel data = LoginModel.fromJson(result.data);
        if (data.token != null) {
          await preferences.putString(SharedPreference.AUTH_TOKEN, data.token!);
          await preferences.putBool(SharedPreference.IS_LOGGED_IN, true);
          if (rememberCheck.value == true) {
            await preferences.putBool(SharedPreference.REMEMBER_PASSWORD, true);
          } else {
            await preferences.putString(SharedPreference.USER_INFO, '');
            userEmailController.clear();
            passwordController.clear();
            await preferences.putBool(
                SharedPreference.REMEMBER_PASSWORD, false);
          }

          Get.offAllNamed(Routes.homeScreen);
        }else{
          showAppSnackBar(data.error);
        }
        showLoading.value = false;
    } catch (e) {
      print("Log in Exception ----> $e");
      showLoading.value = false;
    }


    update();
  }
  signUp() async {
    showLoading.value = true;
    update();
    try {

      ResponseItem result;
      result = await logIn.userRegistering(
          "${userFirstNameController.text} ${userLastNameController.text}",
          userEmailController.text,
          passwordController.text);

      LoginModel data = LoginModel.fromJson(result.data);

      if(data.success!){
        if (data.registrationResponse != null) {
          showLoading.value = false;
          preferences.putString(SharedPreference.AUTH_TOKEN, data.token!);
          preferences.putBool(SharedPreference.IS_LOGGED_IN, true);
          // Map<String, dynamic> userMap = data.toJson();
          // String encodedData = jsonEncode(userMap);
          // preferences.putString(SharedPreference.USER_INFO, encodedData);

          Get.offAllNamed(Routes.homeScreen);

        }
        showLoading.value = false;
      } else {
        showLoading.value = false;
        showAppSnackBar(data.error);
      }

    } catch (e) {
      debugPrint("Registering Exception ----> $e");
      showLoading.value = false;
    }

    ///
    update();
  }

  onCheckTerms(bool value) {
    termCheck.value = value;
    update();

  }

  onCheckRememberMe(bool value) {
    rememberCheck.value = value;
    update();
  }


}
