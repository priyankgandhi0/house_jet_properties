import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/ui/widgets/app_loader.dart';
import 'package:house_jet_properties/ui/widgets/loading_builder_comon.dart';
import 'package:house_jet_properties/ui/widgets/no_data_found.dart';
import 'package:house_jet_properties/utils/app_schedule_time_dialog.dart';
import 'package:house_jet_properties/utils/extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/map_utils.dart';
import '../../../../theme/app_colors.dart';

class PropertiesDetail extends StatelessWidget {
  PropertiesDetail({Key? key}) : super(key: key);

  final SearchScreenController searchController =
      Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SearchScreenController>(
        initState: (initState) {
          // "4911-south-burrows-avenue-springfield-mo-60236180"
          Future.delayed(Duration.zero).then((value) =>
              searchController.getPropertiesByAlias(Get.arguments
                 ));
        },
        builder: (ctrl) {
          return Stack(
            children: [
              ctrl.propertiesDetailByAliasName == null? const NoDataFoundWidget():   Stack(
                children: [
                  SizedBox(
                    height: 270,
                    child: Stack(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: Get.height,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) =>
                                ctrl.onImageChange(index),
                          ),
                          itemCount: ctrl.propertiesDetailByAliasName!.propertyPhotos!.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Image.network(
                            width: Get.width,
                            ctrl.propertiesDetailByAliasName!
                                    .propertyPhotos![itemIndex].mediumUrl ??
                                "",
                            fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                   return loadingBuilder(context, child, loadingProgress);
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return networkImageErrorBuilder(context, error, stackTrace);
                                },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              alignment: Alignment.center,
                              height: 18,
                              width: 46,
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50)),
                              child: AnimatedSmoothIndicator(
                                activeIndex: ctrl.imageSliderIndex,
                                count: 3,
                                effect: JumpingDotEffect(
                                  spacing: 4,
                                  dotHeight: 6,
                                  dotWidth: 6,
                                  dotColor: const Color(0xffC8D9E1),
                                  activeDotColor: app_Orange_FF7448,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 220),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: Get.height,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (ctrl.propertiesDetailByAliasName!.alias ?? "")
                                      .appBlackText1B1B1B(
                                          size: 22, fontWeight: FontWeight.w600),
                                  10.0.addHSpace(),
                                  ("\$${ctrl.propertiesDetailByAliasName!.listPrice ?? ""}")
                                      .toString()
                                      .appBlackText1B1B1B(
                                          size: 20, fontWeight: FontWeight.w700),
                                  10.0.addHSpace(),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const CircleAvatar(
                                        radius: 6,
                                        backgroundColor: Color(0xff3EE763),
                                      ),
                                      7.0.addWSpace(),
                                      "For Sale".appBlackText1B1B1B(
                                          size: 12, fontWeight: FontWeight.w600),
                                    ],
                                  ),
                                  30.0.addHSpace(),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: app_Orange_FFF0EC,
                                            borderRadius:
                                                BorderRadiusDirectional.circular(6),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(bedIcon,
                                                  height: 19, width: 23),
                                              5.0.addWSpace(),
                                              ("${ctrl.propertiesDetailByAliasName!.beds ?? ""} Beds")
                                                  .toString()
                                                  .appOrangeText(
                                                      size: 12,
                                                      fontWeight: FontWeight.w500)
                                            ],
                                          ),
                                        ),
                                      ),
                                      10.0.addWSpace(),
                                      Expanded(
                                        flex: 10,
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: app_Orange_FFF0EC,
                                            borderRadius:
                                                BorderRadiusDirectional.circular(6),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(bathRoomIcon,
                                                    height: 19, width: 23),
                                                5.0.addWSpace(),
                                                ("${ctrl.propertiesDetailByAliasName!.baths ?? ""} Bathrooms")
                                                    .toString()
                                                    .appOrangeText(
                                                        size: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      10.0.addWSpace(),
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: app_Orange_FFF0EC,
                                            borderRadius:
                                                BorderRadiusDirectional.circular(6),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(sqftIcon,
                                                  height: 19, width: 23),
                                              5.0.addWSpace(),
                                              ("${ctrl.propertiesDetailByAliasName!.sqFtTotal ?? ""} Sqft")
                                                  .toString()
                                                  .appOrangeText(
                                                      size: 12,
                                                      fontWeight: FontWeight.w500)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  30.0.addHSpace(),
                                  "Description".appBlackText1B1B1B(
                                      size: 18, fontWeight: FontWeight.w600),
                                  10.0.addHSpace(),
                                  // Description
                                  (ctrl.propertiesDetailByAliasName!
                                              .publicRemarks ??
                                          "")
                                      .appGreyText(
                                          size: 14, fontWeight: FontWeight.w400),
                                  30.0.addHSpace(),
                                  "Address".appBlackText1B1B1B(
                                      size: 18, fontWeight: FontWeight.w600),
                                  ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    contentPadding: EdgeInsets.zero,
                                    horizontalTitleGap: 10,
                                    minLeadingWidth: 0,
                                    minVerticalPadding: 0,
                                    leading: Image.asset(locationIcon, height: 20),
                                    title: ctrl
                                        .propertiesDetailByAliasName!.streetAddress!
                                        .appGreyText(
                                            size: 16,
                                            fontWeight: FontWeight.w400,
                                            maxLines: 1),
                                  ),
                                  Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                      border: Border.all(
                                          color: const Color(0xffCCD8DE), width: 1),
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                      child: GoogleMap(
                                        zoomControlsEnabled: false,
                                        mapToolbarEnabled: false,
                                        scrollGesturesEnabled: false,
                                        myLocationButtonEnabled: false,
                                        zoomGesturesEnabled: false,
                                        onTap: (argument) => ctrl.launchingUrl(
                                            ctrl.propertiesDetailByAliasName!.latitude!,
                                            ctrl.propertiesDetailByAliasName!.longitude!),
                                        onMapCreated: (GoogleMapController controller) async {
                                          final marker = Marker(
                                            onTap: () => ctrl.launchingUrl(
                                                ctrl.propertiesDetailByAliasName!
                                                    .latitude!,
                                                ctrl.propertiesDetailByAliasName!
                                                    .longitude!),
                                            markerId: const MarkerId('place_name'),
                                            icon: await MapUtils().getMarkerImage(
                                                const Size(150.0, 150.0)),
                                            position: LatLng(ctrl.propertiesDetailByAliasName!.latitude!,
                                                ctrl.propertiesDetailByAliasName!.longitude!),
                                          );
                                          ctrl.markers2[
                                                  const MarkerId('place_name')] =
                                              marker;
                                          ctrl.update();
                                        },
                                        markers: ctrl.markers2.values.toSet(),
                                        initialCameraPosition: CameraPosition(
                                            target: LatLng(
                                                ctrl.propertiesDetailByAliasName!
                                                    .latitude!,
                                                ctrl.propertiesDetailByAliasName!
                                                    .latitude!),
                                            zoom: 15.5),
                                      ),
                                    ),
                                  ),
                                  (130.0).addHSpace(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Image.asset(likeIcon, height: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 45),
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadiusDirectional.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(backArrowIcon, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Obx(() => AppLoader(visible: ctrl.showLoading.value))
            ],
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppButton(
                onTap: () {
                  searchController.makePhoneCall("(667) 596 5407");

                  // Get.toNamed(Routes.contactAnAgentScreen);
                },
                text: "CONTACT AN AGENT",
                textSize: 16,
                textFontWeight: FontWeight.w600,
                radius: 50),
            (10.0).addHSpace(),
            AppButton(
                unselected: true,
                onTap: () {
                  //Get.toNamed(Routes.contactAnAgentScreen);
                  Get.dialog(AppScheduleTimeDialog(
                    context: context,
                    buttonColor: Colors.blue,
                    onTap: () {
                      Get.back();
                    },
                    showCancelButton: true,
                    buttonText: "Yes",
                    description: "Are you sure you  want to Sign Out ?",
                    tittle: "Schedule a showing",
                  ));
                },
                text: "Schedule a showing".toUpperCase(),
                textSize: 16,
                textFontWeight: FontWeight.w600,
                radius: 50),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


