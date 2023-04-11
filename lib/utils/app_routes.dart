import 'package:get/get.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/filter_screen/filter_screen.dart';


class Routes {
  //splash screen

  static const String filterScreen = "/FilterScreen";

  static List<GetPage> pages = [
    //splash screen

    GetPage(name: filterScreen, page: () => FilterScreen()),
  ];
}
