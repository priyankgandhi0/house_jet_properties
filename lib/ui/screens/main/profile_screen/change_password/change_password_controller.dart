import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  clearTextFiled() {

    oldPassword.clear();
    newPassword.clear();
    confirmNewPassword.clear();
  }

}
