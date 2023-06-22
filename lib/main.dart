import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/Theme/app_colors.dart';
import 'package:house_jet_properties/constants/request_const.dart';
import 'package:house_jet_properties/ui/screens/main/home_screen/home_screen.dart';
import 'package:house_jet_properties/utils/check_conneaction.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';


import 'ui/screens/startup/login_screen/login_screen.dart';
import 'utils/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  final MyConnectivity _connectivity = MyConnectivity.instance;
  _connectivity.initialise();
  Map _source = {ConnectivityResult.none: false};
  _connectivity.myStream.listen((source) {
    switch (source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        hasInternet.value = true;
        break;
      case ConnectivityResult.wifi:
        hasInternet.value = true;
        break;
      case ConnectivityResult.none:
        hasInternet.value = false;
        break;
      default:
        hasInternet.value = true;
    }
  });
  listenConnection();
  runApp(
    GetMaterialApp(
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: app_Orange_FF7448),
        ),
        getPages: Routes.pages,
        debugShowCheckedModeBanner: false,
        home:    (preferences.getBool(SharedPreference.IS_LOGGED_IN) ?? false)
        // ? HomeScreen()
            ? HomeScreen()
            : LoginScreen())

  );
}
