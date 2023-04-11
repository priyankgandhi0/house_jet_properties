import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/Theme/app_colors.dart';
import 'package:house_jet_properties/ui/screens/main/home_screen/home_screen.dart';
import 'package:house_jet_properties/ui/screens/startup/login_screen/login_screen.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';


import 'utils/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  runApp(
    GetMaterialApp(
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: app_Orange_FF7448),
        ),
        getPages: Routes.pages,
        debugShowCheckedModeBanner: false,
        home: (preferences.getBool(SharedPreference.IS_LOGGED_IN) ?? false)
            // ? HomeScreen()
            ? HomeScreen()
            : LoginScreen()),
  );
}
