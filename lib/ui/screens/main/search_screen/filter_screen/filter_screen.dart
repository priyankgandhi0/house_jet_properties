import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/filter_screen/filter_screen_controller.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/filter_screen/for_sale_screen.dart';
import 'package:house_jet_properties/ui/widgets/app_header_bar.dart';
import 'package:house_jet_properties/ui/widgets/custom_tab_indicator.dart';
import 'package:house_jet_properties/utils/extension.dart';


import '../../../../../theme/app_colors.dart';
import '../../../../../theme/app_strings.dart';

class FilterScreen extends StatelessWidget {
  FilterScreenController filterScreenController =
      Get.put(FilterScreenController());

  FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterScreenController>(builder: (ctrl) {
      return Scaffold(
        appBar: appHeaderBar(
            titleText: filterText,
            leadingOnTap: () {
              Get.back();
            },
            actionOnTap: () {},
            bottom: PreferredSize(
              preferredSize: Size.zero,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    TabBar(
                      controller: ctrl.tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: CustomTabIndicator(
                          color: app_Orange_FF7448, indicatorHeight: 2),
                      tabs: [
                        colorHandle('For sale', ctrl.currentIndex.value, 0),
                        //.appGreyText(size: 14, fontWeight: FontWeight.w500),
                        colorHandle('For Rent', ctrl.currentIndex.value, 1),
                        //.appGreyText(size: 14, fontWeight: FontWeight.w500),
                        //colorHandle('For Sold', ctrl.currentIndex.value, 2),
                      ],
                    ),
                  ],
                ),
              ),
            )),
        body: TabBarView(
          controller: ctrl.tabController,
          children: [
            ForSaleScreen(),
            ForSaleScreen(),
            // ForSaleScreen(),
          ],
        ),
      );
    });
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
}
