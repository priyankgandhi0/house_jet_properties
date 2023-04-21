import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/theme/app_assets.dart';


import '../../../../Theme/app_colors.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeScreenController homeController = Get.put(HomeScreenController());

  // final ContactController contactsScreenCtr = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    // print("hasInternet Valaue == hasInternet Valaue ==${hasInternet.value}");

    return GetBuilder<HomeScreenController>(builder: (ctrl) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        key: ctrl.scaffoldKey,
        bottomNavigationBar: Obx(
          () => Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ]),
            child: BottomNavigationBar(
              elevation: 20,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(height: 1.5),
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(navigationSearchIcon),
                    // color: app_grey_99A7AE,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(navigationFavouriteIcon),
                      // color: app_grey_99A7AE,
                    ),
                    label: 'favorite'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(navigationProfileIcon),
                      // color: app_grey_99A7AE,
                    ),
                    label: 'Profile'),
              ],
              currentIndex: ctrl.currentIndex.value,
              selectedItemColor: app_Orange_FF7448,
              unselectedItemColor: app_grey_99A7AE,
              onTap: (index) {
                ctrl.onPageChange(index);
              },
            ),
          ),
        ),
        body: Obx(
          () => Stack(
            children: [
              ctrl.screens[ctrl.currentIndex.value],
            ],
          ),
        ),
        /*     drawer: AppDrawer(
            // isIndexCallback: (index){
            //     if(index == 1){
            //       ctrl.currentIndex.value = 1;
            //        preferences.putString(SharedPreference.SORT, "Oldest To Newest");
            //       preferences.putBool(SharedPreference.FILTERED_API_CALLED, true);
            //     }
            // },
            ),*/

        // Drawer(
        //   backgroundColor: app_Orange_FF7448,
        //   // child: Column(
        //   //   children: [
        //   //
        //   //     (100.0).addVSpace(),
        //   //     ListTile(
        //   //       onTap: (){
        //   //         preferences.clearFilter();
        //   //         Get.back();
        //   //
        //   //       },
        //   //       title: "LogOut".appBlackText1B1B1B(),
        //   //       trailing: Icon(Icons.logout_sharp),
        //   //     )
        //   //   ],
        //   // )
        // ),
      );
    });
  }
}
