import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/constants/request_const.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/utils/extension.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';

import '../../theme/app_colors.dart';

showNoInternetDialog() =>
    Future.delayed(Duration.zero).then((value) => showAlertDialog());

showAlertDialog() {
  // set up the buttons
  // Widget cancelButton = TextButton(
  //   child: Text("Cancel"),
  //   onPressed: () {},
  // );
  Widget continueButton = TextButton(
    child: Text("Retry", style: TextStyle(color: app_Orange_FF7448)),
    onPressed: () {},
  );

  // set up the AlertDialog
  WillPopScope alert = WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: AlertDialog(
      title: Row(
        children: [
          Image.asset(cautionIcon, height: 20, width: 20),
          (10.0).addHSpace(),
          Expanded(
            child: ("No internet connection")
                .appBlackText1B1B1B(fontWeight: FontWeight.w500, size: 20),
          )
        ],
      ),
      content:
          ("Please, check internet connection on your smartphone to use the application")
              .appColorChangeText(
                  fontWeight: FontWeight.w500,
                  size: 16,
                  color: app_grey_99A7AE),
      actions: [
        continueButton,
        // okButton,
      ],
    ),
  );
  Get.dialog(
    alert,
    barrierDismissible: false,
  );
  // show the dialog
}

listenConnection() {
  return hasInternet.addListener(() {
    if (preferences.getBool(SharedPreference.IS_LOGGED_IN) ?? false) {
      if (hasInternet.value) {
        Get.back();

        print("hasInternet true");
      } else {
        print("hasInternet false");
        showNoInternetDialog();
      }
    }
  });
}
