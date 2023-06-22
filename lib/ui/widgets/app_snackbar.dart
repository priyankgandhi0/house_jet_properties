import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/utils/extension.dart';


import '../../../theme/app_colors.dart';



appSnachBar({required String title, required String message}) {
  return Get.showSnackbar(GetSnackBar(
    title: title,
    message: message,
    backgroundColor: app_text_white_ffffff,
    titleText: title.appRedText(size: 18, fontWeight: FontWeight.w500),
    boxShadows: [

      BoxShadow(

        color: Colors.black.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 8,
        offset: const Offset(0, 1), // changes position of shadow
      ),
    ],
    messageText: message.appRedText(size: 14),
    margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
    borderRadius: 5,
    duration: const Duration(seconds: 3),
  ));
}
