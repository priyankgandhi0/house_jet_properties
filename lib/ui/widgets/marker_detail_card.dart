import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../theme/app_colors.dart';

class MarkerDetailCard extends StatelessWidget {
  MarkerDetailCard({Key? key}) : super(key: key);

  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (ctrl) => Container(
        height: 380,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 12,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 5),
            child: Column(
              children: [
                (10.0).addHSpace(),
                Center(
                  child: Container(
                    width: 70,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        shape: BoxShape.rectangle,
                        color: const Color(0xffC5CFD3)),
                  ),
                ),
                (10.0).addHSpace(),
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.propertiesDetailList.length,
                    onPageChanged: (index) {
                      ctrl.setInfoWindowModel(ctrl.propertiesDetailList[index],
                          index: index, isFormDrag: true);
                    },
                    itemBuilder: (context, index) => SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: 215,
                            child: Stack(
                              children: [
                                Container(
                                  height: 195,
                                  margin: const EdgeInsets.only(right: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            ctrl.propertiesDetailModel!.image),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                50)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const CircleAvatar(
                                            radius: 5,
                                            backgroundColor: Color(0xff3EE763),
                                          ),
                                          7.0.addWSpace(),
                                          "For Sale".whiteText(
                                              size: 12,
                                              fontWeight: FontWeight.w600),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: FloatingActionButton(
                                      onPressed: () {},
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child:
                                            Image.asset(likeIcon, height: 22),
                                      ),
                                    ),
                                  ).paddingOnly(right: 10),
                                )
                              ],
                            ),
                          ),
                          ctrl.propertiesDetailModel!.name.appBlackText1B1B1B(
                              size: 18, fontWeight: FontWeight.w600),
                          8.0.addHSpace(),
                          '\$${ctrl.propertiesDetailModel?.price}'
                              .appBlackText1B1B1B(
                                  size: 20, fontWeight: FontWeight.w700),
                          10.0.addHSpace(),
                          ("${ctrl.propertiesDetailModel?.bedSize} beds, ${ctrl.propertiesDetailModel?.bathRoomSize} Bathrooms, 1 Swimming Pool, ${ctrl.propertiesDetailModel?.squareFt} Sqft Lot")
                              .toString()
                              .appGreyText(
                                  size: 14, fontWeight: FontWeight.w400),
                          ListTile(
                            visualDensity: const VisualDensity(vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 10,
                            minLeadingWidth: 0,
                            leading: Image.asset(locationIcon, height: 20),
                            title: Padding(
                              padding: const EdgeInsets.only(
                                top: 0,
                              ),
                              child: ctrl.propertiesDetailModel?.address
                                  .appGreyText(
                                      size: 14, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
