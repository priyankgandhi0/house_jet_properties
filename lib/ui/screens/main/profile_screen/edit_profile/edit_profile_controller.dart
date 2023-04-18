import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/utils/image_picker.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';


class EditProfileController extends GetxController {
  File? profileImage;

  TextEditingController userEmail = TextEditingController();
  TextEditingController userFirstName = TextEditingController();
  TextEditingController userLastName = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    userEmail.text = preferences.getString(SharedPreference.USER_EMAIL)!;
  }

  pickImage(BuildContext context) {
    PickImageOnly().openImageChooser(

        context: context,
        wantFile: false,
        onImageChose: (image) {
          profileImage = image!;
          update();
        });
  }
}
