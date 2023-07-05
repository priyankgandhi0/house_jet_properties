import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/models/get_loged_in_user_profile_model.dart';
import 'package:house_jet_properties/ui/screens/main/favourite_screen/favourite_screen.dart';
import 'package:house_jet_properties/ui/screens/main/profile_screen/profile_screen.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';




class HomeScreenController extends GetxController {
  SearchScreenController searchController = Get.put(SearchScreenController());

  @override
  void onInit() {
    setData();
    super.onInit();
  }

  UserData agentData = UserData();
  RxInt currentIndex = 0.obs;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  onPageChange(int index) {
    if(searchController.isBottomSheetOpen){
      searchController.onBottomSheetOpen();

    }
    currentIndex.value = index;
    update();
  }

  setData() {

    agentData = SharedPreference.getUserModel() ?? UserData();
    update();

  }

  List<Widget> screens = [
    SearchHomeScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
  List<String> title = [
    'Search',
    'favorite',
    'My Profile',
  ];

/*  addLead() {
    Get.toNamed(Routes.addLead);
  }*/

/*  importLead() {
    Get.toNamed(Routes.importLead);
  }*/

}
