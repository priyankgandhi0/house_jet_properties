// KindaCode.com
// main.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_jet_properties/models/properties_detail.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/theme/app_strings.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/custom_tab_indicator.dart';
import 'package:house_jet_properties/utils/extension.dart';
import '../../../../Theme/app_colors.dart';


class FullScreenSearchModal extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return GetBuilder<SearchScreenController>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: app_text_white_ffffff,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4,
          leading: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  height: 17,
                  width: 50,
                  child: Image.asset(
                    backArrowIcon,
                    width: 17,
                    height: 13,
                  ),
                ),
              ),
            ],
          ),
          title: TextField(
            // onChanged: (val) {
            //   ctrl.resultSearch(val);
            // },
            onChanged:(value) {
          if (ctrl.debounce?.isActive ?? false) ctrl.debounce!.cancel();
          ctrl.debounce = Timer(const Duration(milliseconds: 400), () {
          if (value.isNotEmpty) {
          ctrl.autoCompleteSearch(value);
          } else {
          ctrl.predictions.clear();
          }
          });
          },
            cursorColor: Colors.black26,
            controller: ctrl.searchFiledController,
            style: appTextStyleBlack500,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search...",
              hintStyle: appTextStyleGrey400,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {

                ctrl.clearAllRecently(isForRecently:false,context: context);



              },
              icon: Image.asset(
                closeIcon,
                width: 20,
                height: 20,
                color: app_Orange_FF7448,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              DecoratedBox(
                decoration: BoxDecoration(
                  //This is for background color
                  color: Colors.white.withOpacity(0.0),
                  //This is for bottom border that is needed
                  border: Border(
                      bottom: BorderSide(color: app_grey_99A7AE, width: 0.8)),
                ),
                child: TabBar(

                  controller: ctrl.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: CustomTabIndicator(
                      color: app_Orange_FFB49C, indicatorHeight: 2),
                  tabs: [

                    colorHandle('Buy', ctrl.currentIndex.value, 0),
                    //.appGreyText(size: 14, fontWeight: FontWeight.w500),
                    colorHandle('Rent', ctrl.currentIndex.value, 1),
                    //.appGreyText(size: 14, fontWeight: FontWeight.w500),
                    colorHandle('Just Sold', ctrl.currentIndex.value, 2),
                  ],
                ),
              ),
              (20.0).addHSpace(),

              Row(
                children: [
                  Icon(
                    Icons.gps_fixed,
                    color: app_Orange_FF7448,
                  ),
                  (10.0).addWSpace(),
                  userCurrentLocationText.appOrangeText600(
                      size: 16, fontWeight: FontWeight.w600),
                ],
              ).paddingSymmetric(horizontal: 20),
              (15.0).addHSpace(),

              Divider(
                color: app_grey_99A7AE,
                height: 2,
              ),
              (15.0).addHSpace(),

              ctrl.predictions.isEmpty ? (0.0).addHSpace() :placesText.appBlackText1B1B1B(
                      size: 16, fontWeight: FontWeight.w600).paddingSymmetric(horizontal: 20),

              ctrl.predictions.isEmpty ? 0.0.addHSpace(): ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ctrl.predictions.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () async{
                    LatLng locationData = await ctrl.getLocationData(ctrl.predictions[index].description!);
                    Get.back();
                    PropertiesModel property =  PropertiesModel(
                        id:int.parse(ctrl.predictions[index].id??"58"),
                        // name: ctrl.predictions[index].description!,
                        // price: 1801000,
                        // image: 'http://codonnier.tech/dipak/flutter/housejet_property/ambi.png',
                        // isForSale: 1,
                        // description:ctrl.predictions[index].description!,
                        // bedSize: 3,
                        // squareFt: 1200,
                        //     address:ctrl.predictions[index].description! ,
                        //       bathRoomSize: 2,
                        //       lat:locationData.latitude,
                        //       long: locationData.longitude,

                    );
                    ctrl.setInfoWindowModel(property,isFormDrag: true);
                    ctrl.setToRecentData(index);

                  },
                  child: Container(

                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (ctrl.predictions[index].description!).appBlackText1B1B1B(
                            size: 16, fontWeight: FontWeight.w400),
                        (5.0).addHSpace(),
                        "For Sale".appGreyText(size: 14, fontWeight: FontWeight.w400)



                      ],
                    ),
                  ),
                ),
              ),
              ctrl.predictions.isEmpty ? (0.0).addHSpace(): (30.0).addHSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  recentlyViewedText.appBlackText1B1B1B(
                      size: 16, fontWeight: FontWeight.w600),


                  GestureDetector(
                    onTap: (){
                      ctrl.clearAllRecently();
                    },
                    child: SizedBox(
                      child:  clearAllText.appOrangeText600(
                          size: 14, fontWeight: FontWeight.w500),
                    ),
                  )

                ],
              ).paddingSymmetric(horizontal: 20),
              // Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     child: recentlyViewedText.appBlackText1B1B1B(
              //         size: 16, fontWeight: FontWeight.w600)),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ctrl.recentViewedList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () async{
                    LatLng locationData = await ctrl.getLocationData(ctrl.recentViewedList[index].description!);
                    Get.back();
                    PropertiesModel property =  PropertiesModel(
                      id:int.parse(ctrl.recentViewedList[index].id??"58"),
                      // name: ctrl.recentViewedList[index].description!,
                      // price: 1801000,
                      // image: 'http://codonnier.tech/dipak/flutter/housejet_property/ambi.png',
                      // isForSale: 1,
                      // description:ctrl.recentViewedList[index].description!,
                      // bedSize: 3,
                      // squareFt: 1200,
                      // address:ctrl.recentViewedList[index].description! ,
                      // bathRoomSize: 2,
                      // lat:locationData.latitude,
                      // long: locationData.longitude,


                    );
                    ctrl.setInfoWindowModel(property,isFormDrag: true);


                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (ctrl.recentViewedList[index].description!).appBlackText1B1B1B(
                            size: 16, fontWeight: FontWeight.w400),
                        (5.0).addHSpace(),

                        "For Sale".appGreyText(size: 14, fontWeight: FontWeight.w400),


                      ],
                    ),
                  ),
                ),
              ),

              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //
              //       "433 sylvan Ave Spc 16, Mountain View, CA"
              //           .appBlackText1B1B1B(
              //               size: 16, fontWeight: FontWeight.w400),
              //     ],
              //   ),
              // ),

              // const ListTile(
              //   title: Text('How to fry a chicken'),
              //   leading: Icon(Icons.search),
              //   trailing: Icon(Icons.close),
              // ),
              // const ListTile(
              //   title: Text('KindaCode.com'),
              //   leading: Icon(Icons.search),
              //   trailing: Icon(Icons.close),
              // ),
              // const ListTile(
              //   title: Text('Goodbye World'),
              //   leading: Icon(Icons.search),
              //   trailing: Icon(Icons.close),
              // ),
              // const ListTile(
              //   title: Text('Cute Puppies'),
              //   leading: Icon(Icons.search),
              //   trailing: Icon(Icons.close),
              // )

            ],
          ),
        ),
      );
    });
  }

  // animations for the search modal
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}

colorHandle(String title, int currentIndex, int index) {
  if (currentIndex == index) {
    return Tab(
      child: title.appOrangeText(size: 14, fontWeight: FontWeight.w500),
    );
  } else {
    return Tab(
      child: title.appGreyText(size: 14, fontWeight: FontWeight.w500),
    );
  }
}

// This is the main screen of the application
// class KindaCodeDemo extends StatelessWidget {
//   const KindaCodeDemo({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('KindaCode.com'), actions: [
//         // this button is used to open the search modal
//         IconButton(
//           icon: const Icon(Icons.search),
//           onPressed: () => _showModal(context),
//         )
//       ]),
//       body: Container(),
//     );
//   }
// }
