import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_jet_properties/theme/app_assets.dart';

import 'package:house_jet_properties/ui/screens/main/properties_detail_screen/properties_detail_screen.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_module.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/utils/app_routes.dart';
import 'package:house_jet_properties/utils/extension.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';


import '../../../../theme/app_colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (ctrl) => Scaffold(
          key: searchController.scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              ctrl.viewAsGoogleMap
                  ? GoogleMap(
                      onTap: (argument) {
                        if (ctrl.isBottomSheetOpen) {
                          Navigator.pop(context);
                          ctrl.onBottomSheetOpen();
                        }
                      },
                      zoomGesturesEnabled: true,
                      mapType: MapType.normal,
                      padding: const EdgeInsets.only(top: 15, right: 7),
                      zoomControlsEnabled: false,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      mapToolbarEnabled: false,
                      initialCameraPosition: ctrl.cameraPosition,
                      onMapCreated: (GoogleMapController controller) {
                        ctrl.manager.setMapId(controller.mapId);
                        ctrl.mapController = controller;
                        // ctrl.controller.complete(controller);
                      },
                   
                      markers: ctrl.markers,
                     // circles: ctrl.circles,
                     //  polygons: ctrl.polygon,
                      onCameraMove: (position) {
                        ctrl.manager.onCameraMove(position);
                      },
                      onCameraIdle: ctrl.manager.updateMap,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: ListView.separated(

                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          itemBuilder: (context, index) => InkWell(
                                overlayColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                onTap: () {
                                  ctrl.imageSliderIndex = 0;
                                  ctrl.setInfoWindowModel(
                                      ctrl.propertiesDetailList[index]);
                                  if(preferences.getBool(SharedPreference.IS_LOGGED_IN) ?? false){
                                    Get.toNamed(Routes.propertyDetailScreen);
                                  }else{
                                    Get.toNamed(Routes.loginScreen);
                                  }


                                },
                                child: Container(
                                  height: 210,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.1),
                                            BlendMode.darken),
                                        image: NetworkImage(ctrl
                                            .propertiesDetailList[index].image),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(

                                              color: Colors.black54,
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(50)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      Color(0xff3EE763),
                                                ),
                                                7.0.addWSpace(),
                                                "For Sale".whiteText(
                                                    size: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ctrl.propertiesDetailList[index]
                                                    .name
                                                    .whiteText(
                                                        size: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                5.0.addHSpace(),
                                                ("\$${ctrl.propertiesDetailList[index].price}")
                                                    .toString()
                                                    .whiteText(
                                                        size: 20,
                                                        fontWeight:
                                                            FontWeight.w700),
                                              ],
                                            ),
                                            Image.asset(likeIcon, height: 22),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              16.0.addHSpace(),
                          itemCount: ctrl.propertiesDetailList.length),
                    ),
              Column(
                children: [
                  Container(
                    height: 140,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: ctrl.viewAsGoogleMap
                          ? Colors.transparent
                          : Colors.white,
                      boxShadow: [
                        !ctrl.viewAsGoogleMap
                            ? BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(
                                    0, 4), // changes position of shadow
                              )
                            : const BoxShadow(color: Colors.transparent)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 54,
                              decoration: BoxDecoration(
                                color: ctrl.viewAsGoogleMap
                                    ? Colors.white
                                    : const Color(0xffF5F8FB),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  ctrl.viewAsGoogleMap
                                      ? BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0,
                                              4), // changes position of shadow
                                        )
                                      : const BoxShadow(
                                          color: Color(0xffF5F8FB))
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      navigationSearchIcon,
                                      height: 25,
                                      color: app_Orange_FF7448,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextField(
                                          onTap: () => _showModal(context),
                                          // onChanged: (val) {
                                          //   ctrl.resultSearch(val);
                                          // },
                                          readOnly: true,
                                          cursorColor: Colors.black26,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Search...",
                                            hintStyle: TextStyle(
                                                color: Color(0xff99A7AE),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      miceIcon,
                                      height: 25,
                                      color: app_Orange_FF7448,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          16.0.addWSpace(),
                          Expanded(
                            child: InkWell(
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              onTap: () {
                                searchController.onViewGoogleMap();
                              },
                              child: Container(
                                height: 54,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF5F8FB),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      ctrl.viewAsGoogleMap
                                          ? BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 8,
                                              offset: const Offset(0,
                                                  4), // changes position of shadow
                                            )
                                          : const BoxShadow(
                                              color: Color(0xffF5F8FB))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset(
                                      searchController.viewAsGoogleMap
                                          ? listMapIcon
                                          : mapListIcon),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ctrl.viewAsGoogleMap
                      ? SizedBox(
                          height: 50,
                          child: ListView.separated(
                              // shrinkWrap: true,
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, bottom: 10),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                bool sameIndex = ctrl.filterIndex == index;
                                return InkWell(
                                  onTap: () {
                                    ctrl.onFilterClick(index);
                                    ctrl.onFilterClickOpenBottomSheet();
                                  },
                                  child: Container(
                                    width: 108,
                                    decoration: BoxDecoration(
                                      color: sameIndex
                                          ? app_Orange_FF7448
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(

                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0,
                                              4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        index == 0
                                            ? Image.asset(
                                                filterIcon,
                                                height: 15,
                                                color: sameIndex
                                                    ? Colors.white
                                                    : app_text_black_1B1B1B,
                                              ).paddingOnly(right: 5)
                                            : const SizedBox(),
                                        (ctrl.filterTextList[index])
                                            .toString()
                                            .mediumText(
                                                color: sameIndex
                                                    ? Colors.white
                                                    : app_text_black_1B1B1B,
                                                size: 14,
                                                fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  10.0.addWSpace(),
                              itemCount: ctrl.filterTextList.length),
                        )
                      : const SizedBox()
                ],
              ),

              ///Current location button
              ctrl.viewAsGoogleMap
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(right: 20, bottom: 40),
                        height: 60,
                        child: FloatingActionButton(
                          heroTag: "Current location button",
                          backgroundColor: Colors.white,
                          onPressed: () {
                            searchController.getCurrentPosition();
                          },
                          child: Icon(Icons.my_location_rounded,
                              color: app_Orange_FF7448, size: 34),
                        ),
                      ),
                    )
                  : const SizedBox(),



              // ctrl.searchFiledController.text.isNotEmpty
              //     ? Align(
              //         alignment: Alignment.bottomRight,
              //         child: _showModal(context))
              //     : (0.0).addHSpace(),
            ],
          )),
    );
  }

  void _showModal(BuildContext context) {
    Navigator.of(context).push(FullScreenSearchModal());
    //return FullScreenSearchModal();
  }
}
