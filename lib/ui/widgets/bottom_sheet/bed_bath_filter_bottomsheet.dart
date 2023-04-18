import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../theme/app_colors.dart';


class BedBathFilterBottomSheet extends StatelessWidget {
  BedBathFilterBottomSheet({Key? key}) : super(key: key);

  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (ctrl) => Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20), topEnd: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              10.0.addHSpace(),
              Container(
                width: 70,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    shape: BoxShape.rectangle,
                    color: const Color(0xffC5CFD3)),
              ),
              (20.0).addHSpace(),
              Stack(
                alignment: Alignment.center,
                children: [

                  "Bed / Bath".appBlackText1B1B1B(
                      size: 20, fontWeight: FontWeight.w600),

                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(closeIcon, height: 25)),
                  ),
                ],
              ),
              (30.0).addHSpace(),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: "Bedrooms"
                    .appBlackText1B1B1B(size: 16, fontWeight: FontWeight.w500),
              ),
              (10.0).addHSpace(),
              SizedBox(
                height: 45,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      bool sameIndex = ctrl.filterBedroomIndex == index;
                      return InkWell(
                        onTap: () {
                          ctrl.onBedroomFilterClick(index);
                        },
                        child: Container(
                          width: Get.width / 6.2,
                          decoration: BoxDecoration(
                            color:
                                sameIndex ? app_Orange_FF7448 : app_grey_F5F8FB,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: (ctrl.bedBathList[index])
                                .toString()
                                .mediumText(
                                    color: sameIndex
                                        ? Colors.white
                                        : app_grey_99A7AE,
                                    size: 14,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => 8.0.addWSpace(),
                    itemCount: ctrl.bedBathList.length),
              ),
              20.0.addHSpace(),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: "Bathrooms"
                    .appBlackText1B1B1B(size: 16, fontWeight: FontWeight.w500),
              ),
              10.0.addHSpace(),
              SizedBox(
                height: 45,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      bool sameIndex = ctrl.filterBathroomIndex == index;
                      return InkWell(
                        onTap: () {
                          ctrl.onBathroomFilterClick(index);
                        },
                        child: Container(
                          width: Get.width / 6.2,
                          decoration: BoxDecoration(
                            color:
                                sameIndex ? app_Orange_FF7448 : app_grey_F5F8FB,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: (ctrl.bedBathList[index])
                                .toString()
                                .mediumText(
                                    color: sameIndex
                                        ? Colors.white
                                        : app_grey_99A7AE,
                                    size: 14,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => 8.0.addWSpace(),
                    itemCount: ctrl.bedBathList.length),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: AppButton(
                  onTap: () {},
                  text: "SEE 85 HOMES",
                  textSize: 16,
                  textFontWeight: FontWeight.w600,
                  radius: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
