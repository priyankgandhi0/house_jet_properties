import 'package:get/get.dart';
import 'package:house_jet_properties/ui/screens/main/home_screen/home_screen.dart';
import 'package:house_jet_properties/ui/screens/main/properties_detail_screen/contact_agent_screen/contact_agent_screen.dart';
import 'package:house_jet_properties/ui/screens/main/properties_detail_screen/properties_detail_screen.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/filter_screen/filter_screen.dart';
import 'package:house_jet_properties/ui/screens/startup/forgot_password_screen.dart';
import 'package:house_jet_properties/ui/screens/startup/login_screen/login_screen.dart';
import 'package:house_jet_properties/ui/screens/startup/signup_screen/signup_screen.dart';


class Routes {
  //splash screen

  static const String filterScreen = "/FilterScreen";
  static const String propertyDetailScreen  = "/PropertyDetailScreen";
  static const String loginScreen  = "/LoginScreen";
  static const String signUpScreen  = "/SignUpScreen";
  static const String forgotPasswordScreen  = "/ForgotPasswordScreen";
  static const String homeScreen  = "/homeScreen";
  static const String contactAnAgentScreen  = "/contactAnAgent";

  static List<GetPage> pages = [
    //splash screen
    GetPage(name: filterScreen, page: () => FilterScreen()),
    GetPage(name: propertyDetailScreen, page: () => PropertiesDetail()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: contactAnAgentScreen, page: () => ContactAgentScreen()),

  ];
}
