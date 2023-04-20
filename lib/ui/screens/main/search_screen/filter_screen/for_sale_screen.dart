import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/theme/app_strings.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/filter_screen/filter_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/ui/widgets/app_check_box.dart';
import 'package:house_jet_properties/ui/widgets/app_cupertino_picker.dart';
import 'package:house_jet_properties/ui/widgets/app_price_slider.dart';
import 'package:house_jet_properties/ui/widgets/home_type_card.dart';
import 'package:house_jet_properties/ui/widgets/startup_text_field.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../../../theme/app_colors.dart';


class ForSaleScreen extends StatelessWidget {
  FilterScreenController filterScreenController =
      Get.put(FilterScreenController());

  ForSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FilterScreenController>(builder: (ctrl) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              homeTypeText.appBlackText1B1B1B(
                    size: 16,
                    fontWeight: FontWeight.w600,
              ).paddingOnly(
                    left: 20,
                    top: 20,
                  ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 76,
                      mainAxisSpacing: 10),


                  itemCount: ctrl.homeTypeList.length,
                  itemBuilder: (context, i) => homeTypeCard(
                      onTap: () {
                        ctrl.onHomeCardTypeTap(i);
                      },
                      iconColor: ctrl.homeTypeList[i].isSeleacted
                          ? app_Orange_FF7448
                          : null,
                      textColor: ctrl.homeTypeList[i].isSeleacted
                          ? app_Orange_FF7448
                          : app_grey_99A7AE,
                      borderColor: ctrl.homeTypeList[i].isSeleacted
                          ? app_Orange_FF7448
                          : null,
                      iconName: ctrl.homeTypeList[i].icon,
                      subtitleText:
                          ctrl.homeTypeList[i].subTitleText)).paddingSymmetric(
                  horizontal: 20, vertical: 10),
              Divider(
                color: app_divider_E1EBF0,
              ),
              // textInputFormater: [
              //
              //   FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})'))
              //
              // ],

              priceRangeText
                  .appBlackText1B1B1B(fontWeight: FontWeight.w600, size: 16)
                  .paddingSymmetric(horizontal: 20),
              (10.0).addHSpace(),
              Row(
                children: [
                  Expanded(
                    child: AppTextFields(
                      controller: ctrl.minPriceController,
                      hintText: 'Min Price',
                      fillColor: Colors.transparent,
                      isSecureEntry: false,
                      borderColor: app_grey_E3EAEE,
                      textInputForMater: [
                        FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})'))
                      ],
                    ).paddingSymmetric(horizontal: 5),
                  ),
                  Expanded(
                    child: AppTextFields(
                      controller: ctrl.maxPriceController,
                      hintText: 'Max Price',
                      fillColor: Colors.transparent,
                      isSecureEntry: false,
                      borderColor: app_grey_E3EAEE,
                      textInputForMater: [

                          FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})'))

                      ],
                    ).paddingSymmetric(horizontal: 5),
                  ),
                ],
              ).paddingSymmetric(horizontal: 15),
              priceSlider(
                  context: context,
                  rangeThumbShape: ctrl.indicatorRangeSliderThumbShape,
                  priceStartValue: ctrl.priceStartValue,
                  priceEndValue: ctrl.priceEndValue,
                  onChanged: (val) {
                    ctrl.onPriceRangeChange(val.start, val.end);
                    ctrl.onIndicatorRangeChange(val.start, val.end);
                  }).paddingSymmetric(horizontal: 12),
              (20.0).addHSpace(),
              Divider(
                color: app_divider_E1EBF0,
              ),


              bedRoomText
                  .appBlackText1B1B1B(fontWeight: FontWeight.w600, size: 16)
                  .paddingSymmetric(horizontal: 20),
              (10.0).addHSpace(),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.bedroomList.length,
                  itemBuilder: (context, i) => homeTypeTextCard(
                          onTap: () {
                            ctrl.onBedroomCardTypeTap(i);
                          },
                          borderColor: ctrl.bedroomList[i].isSeleacted
                              ? app_Orange_FF7448
                              : null,
                          child: ctrl.bedroomList[i].subTitleText
                              .appColorChangeText(
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ctrl.bedroomList[i].isSeleacted
                                      ? app_Orange_FF7448
                                      : app_grey_99A7AE)
                              .paddingSymmetric(horizontal: 27, vertical: 12))
                      .paddingOnly(right: 8),
                ),
              ).paddingSymmetric(horizontal: 20),
              (20.0).addHSpace(),
              bathRoomsText
                  .appBlackText1B1B1B(fontWeight: FontWeight.w600, size: 16)
                  .paddingSymmetric(horizontal: 20),
              (10.0).addHSpace(),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.bathroomList.length,
                  itemBuilder: (context, i) => homeTypeTextCard(
                          onTap: () {
                            ctrl.onBathroomCardTypeTap(i);
                          },
                          borderColor: ctrl.bathroomList[i].isSeleacted
                              ? app_Orange_FF7448
                              : null,
                          child: ctrl.bathroomList[i].subTitleText
                              .appColorChangeText(
                                  size: 14,

                                  fontWeight: FontWeight.w500,
                                  color: ctrl.bathroomList[i].isSeleacted
                                      ? app_Orange_FF7448
                                      : app_grey_99A7AE)
                              .paddingSymmetric(horizontal: 27, vertical: 12))
                      .paddingOnly(right: 8),
                ),
              ).paddingSymmetric(horizontal: 20),
              (20.0).addHSpace(),
              ctrl.currentIndex.value == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commuteText
                            .appBlackText1B1B1B(
                                fontWeight: FontWeight.w600, size: 16)
                            .paddingSymmetric(horizontal: 20),
                        (10.0).addHSpace(),
                        AppTextFields(

                          controller: ctrl.commuteController,
                          hintText: commuteDestinationAddressText,
                          trailing: GestureDetector(

                              onTap: () {
                                ctrl.commuteController.clear();
                                ctrl.update();
                              },
                              child: Image.asset(
                                closeIcon,
                                height: 18,
                                width: 18,
                                color: app_grey_99A7AE,
                              ).paddingAll(16)),
                        ).paddingSymmetric(horizontal: 20),
                        (20.0).addHSpace(),
                        selectMaximumDriveTimeText
                            .appBlackText1B1B1B(

                                fontWeight: FontWeight.w400, size: 16)
                            .paddingSymmetric(horizontal: 20),
                        (10.0).addHSpace(),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: ctrl.deriveTimeList.length,
                            itemBuilder: (context, i) => homeTypeTextCard(
                                    onTap: () {
                                      ctrl.onDriveTimeCardTypeTap(i);
                                    },
                                    borderColor:
                                        ctrl.deriveTimeList[i].isSeleacted
                                            ? app_Orange_FF7448
                                            : null,
                                    child: ctrl.deriveTimeList[i].subTitleText
                                        .appColorChangeText(
                                            size: 14,
                                            fontWeight: FontWeight.w500,
                                            color: ctrl.deriveTimeList[i]
                                                    .isSeleacted
                                                ? app_Orange_FF7448
                                                : app_grey_99A7AE)
                                        .paddingSymmetric(
                                            horizontal: 27, vertical: 16))
                                .paddingOnly(right: 8),
                          ),
                        ).paddingSymmetric(horizontal: 20),
                        (10.0).addHSpace(),
                      ],
                    )
                  : 0.0.addHSpace(),
              Divider(
                color: app_divider_E1EBF0,
              ),
              (10.0).addHSpace(),
              ctrl.currentIndex.value == 1
                  ? Column(
                      children: [
                        AppExpansionTile(
                          context: context,
                          isExpanded: ctrl.isPets,
                          onExpansionChanged: (bool val) {
                            ctrl.isPets = !ctrl.isPets;
                            ctrl.update();
                          },
                          tileTileWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              petsText.appBlackText1B1B1B(
                                  fontWeight: FontWeight.w600, size: 16),
                            ],
                          ).paddingOnly(left: 4),
                          childrenWidgetList: ctrl.petsList
                              .map((e) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      e.subTitleText.appBlackText1B1B1B(
                                          size: 16,
                                          fontWeight: FontWeight.w400),
                                      appCheckBox(
                                          value: e.isSeleacted,
                                          onChanged: (bool? val) {
                                            e.isSeleacted = !e.isSeleacted;
                                            ctrl.update();
                                          })
                                    ],
                                  ).paddingOnly(left: 15, right: 8))
                              .toList(),
                        ),
                        AppExpansionTile(
                          context: context,
                          isExpanded: ctrl.isAmenities,
                          onExpansionChanged: (bool val) {
                            ctrl.isAmenities = !ctrl.isAmenities;
                            ctrl.update();
                          },
                          tileTileWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              amenitiesText.appBlackText1B1B1B(
                                  fontWeight: FontWeight.w600, size: 16),
                            ],
                          ).paddingOnly(left: 4),
                          childrenWidgetList: ctrl.amenitiesList
                              .map((e) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      e.subTitleText.appBlackText1B1B1B(
                                          size: 16,

                                          fontWeight: FontWeight.w400),
                                      appCheckBox(
                                          value: e.isSeleacted,
                                          onChanged: (bool? val) {
                                            e.isSeleacted = !e.isSeleacted;
                                            ctrl.update();
                                          })
                                    ],
                                  ).paddingOnly(left: 15, right: 8))
                              .toList(),
                        )
                      ],
                    )
                  : 0.0.addHSpace(),
              ctrl.currentIndex.value == 2
                  ? AppExpansionTile(
                      context: context,
                      isExpanded: ctrl.isSoldWithinScreen,
                      onExpansionChanged: (bool val) {
                        ctrl.isSoldWithinScreen = !ctrl.isSoldWithinScreen;
                        ctrl.update();
                      },
                      tileTileWidget: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          soldWithinText.appBlackText1B1B1B(
                              fontWeight: FontWeight.w500, size: 16),
                          ctrl.isSoldWithinScreen
                              ? "Last 3 Months".appBlackText1B1B1B(
                                  fontWeight: FontWeight.w400, size: 14)
                              : (0.0).addHSpace(),
                        ],
                      ).paddingOnly(left: 4),
                      childrenWidgetList: [
                          SizedBox(
                            height: 150,
                            child: appCupertinoPicker(
                              selectionOverlayWidget: Container(
                                decoration: BoxDecoration(
                                    color: app_Orange_FF7448.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5)),
                              ),

                              childrenList: ctrl.soldWithinList
                                  .map((e) => Center(
                                        child: e.subTitleText
                                            .appColorChangeText(
                                                color: e.isSeleacted
                                                    ? app_Orange_FF7448
                                                    : app_grey_99A7AE,
                                                size: 16,
                                                fontWeight: FontWeight.w400),
                                      ))
                                  .toList(),
                              onSelectedItemChanged: (int index) {
                                for (var data in ctrl.soldWithinList) {
                                  data.isSeleacted = false;

                                  ctrl.soldWithinList[index].isSeleacted = true;
                                  ctrl.update();
                                }
                              },
                            ),
                          )
                              .paddingOnly(left: 15, right: 10)
                              .paddingSymmetric(horizontal: 14)
                        ])
                  : (0.0).addWSpace(),



              ctrl.currentIndex.value == 2 || ctrl.currentIndex.value == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizeText
                            .appBlackText1B1B1B(
                                fontWeight: FontWeight.w600, size: 16)
                            .paddingSymmetric(horizontal: 20),

                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isSquareFit,
                            onExpansionChanged: (bool val) {
                              ctrl.isSquareFit = !ctrl.isSquareFit;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                squareFeetText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w500, size: 16),
                                ctrl.isSquareFit
                                    ? "1250 - 1250 sq ft".appBlackText1B1B1B(
                                        fontWeight: FontWeight.w400, size: 14)
                                    : (0.0).addHSpace(),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl.squareFeetNoMinList
                                            .map((e) => Center(

                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data
                                              in ctrl.squareFeetNoMinList) {
                                            data.isSeleacted = false;
                                            ctrl.squareFeetNoMinList[index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl.squareFeetNoMaxList
                                            .map((e) => Center(
                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data
                                              in ctrl.squareFeetNoMaxList) {
                                            data.isSeleacted = false;
                                            ctrl.squareFeetNoMaxList[index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 14)
                            ]),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isLotSize,
                            onExpansionChanged: (bool val) {
                              ctrl.isLotSize = !ctrl.isLotSize;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                lotSizeText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w500, size: 16),
                                ctrl.isLotSize
                                    ? "2000 - 2000 sq ft".appBlackText1B1B1B(
                                        fontWeight: FontWeight.w400, size: 14)
                                    : (0.0).addHSpace(),
                                
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl.lotSizeNoMinList
                                            .map((e) => Center(
                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data
                                              in ctrl.lotSizeNoMinList) {
                                            data.isSeleacted = false;
                                            ctrl.lotSizeNoMinList[index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl.lotNoMaxList
                                            .map((e) => Center(
                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data in ctrl.lotNoMaxList) {
                                            data.isSeleacted = false;
                                            ctrl.lotNoMaxList[index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 14)
                            ]),
                        ctrl.currentIndex.value == 0
                            ? Column(
                                children: [
                                  Divider(
                                    color: app_divider_E1EBF0,
                                  ),
                                  AppExpansionTile(
                                      context: context,
                                      isExpanded: ctrl.isStatus,
                                      onExpansionChanged: (val) {
                                        ctrl.isStatus = !ctrl.isStatus;
                                        ctrl.update();
                                      },
                                      tileTileWidget: Row(
                                        children: [
                                          statusText.appBlackText1B1B1B(
                                              fontWeight: FontWeight.w600,
                                              size: 16),
                                        ],
                                      ).paddingOnly(left: 4),
                                      childrenWidgetList: [
                                        ...ctrl.statusList
                                            .map((e) => Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    e.subTitleText
                                                        .appBlackText1B1B1B(
                                                            size: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                    appCheckBox(
                                                        value: e.isSeleacted,
                                                        onChanged: (bool? val) {
                                                          e.isSeleacted =
                                                              !e.isSeleacted;
                                                          ctrl.update();
                                                        }),
                                                  ],
                                                ).paddingOnly(
                                                  left: 15,
                                                  right: 8,
                                                ))
                                            .toList(),
                                        (10.0).addHSpace()
                                      ]),
                                ],
                              )
                            : (0.0).addHSpace(),
                        Divider(
                          color: app_divider_E1EBF0,
                        ),
                        (10.0).addHSpace(),
                        propertyDetailText
                            .appBlackText1B1B1B(
                                fontWeight: FontWeight.w600, size: 16)
                            .paddingSymmetric(horizontal: 20),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isStories,
                            onExpansionChanged: (bool val) {
                              ctrl.isStories = !ctrl.isStories;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                storiesText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w500, size: 16),
                                ctrl.isStories
                                    ? "08 - 08".appBlackText1B1B1B(
                                        fontWeight: FontWeight.w400, size: 14)
                                    : (0.0).addHSpace(),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl.storiesDayList
                                            .map((e) => Center(
                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data
                                              in ctrl.storiesDayList) {
                                            data.isSeleacted = false;
                                            ctrl.storiesDayList[index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl.storiesMonthList
                                            .map((e) => Center(
                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data
                                              in ctrl.storiesMonthList) {
                                            data.isSeleacted = false;
                                            ctrl.storiesMonthList[index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 20),
                            ]),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isYearBuilt,
                            onExpansionChanged: (bool val) {
                              ctrl.isYearBuilt = !ctrl.isYearBuilt;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                yearBuiltText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w500, size: 16),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl.yearBuiltList
                                            .map((e) => Center(
                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data in ctrl.yearBuiltList) {
                                            data.isSeleacted = false;
                                            ctrl.yearBuiltList[index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl.yearBuiltList1
                                            .map((e) => Center(
                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data
                                              in ctrl.yearBuiltList1) {
                                            data.isSeleacted = false;
                                            ctrl.yearBuiltList1[index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 20),
                            ]),
                        ...ctrl.propertyDetailList.map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                e.subTitleText.appBlackText1B1B1B(
                                    size: 16, fontWeight: FontWeight.w400),
                                appCheckBox(
                                    value: e.isSeleacted,
                                    onChanged: (bool? val) {
                                      e.isSeleacted = !e.isSeleacted;
                                      ctrl.update();
                                    })
                              ],
                            ).paddingOnly(left: 20, right: 15)),
                        Divider(
                          color: app_divider_E1EBF0,
                        ),
                        homeFeatureText
                            .appBlackText1B1B1B(
                                fontWeight: FontWeight.w600, size: 16)
                            .paddingSymmetric(horizontal: 20),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isHomeFeature,
                            onExpansionChanged: (bool val) {
                              ctrl.isHomeFeature = !ctrl.isHomeFeature;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                poolText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w500, size: 16),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              ...ctrl.homeFeatureList.map((e) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      e.subTitleText.appBlackText1B1B1B(
                                          size: 16,
                                          fontWeight: FontWeight.w400),
                                      Radio<String>(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: e.subTitleText,
                                        groupValue:
                                            ctrl.homeFeatureRadio.subTitleText,
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => app_Orange_FF7448),
                                        //<-- SEE HERE
                                        onChanged: (String? value) {
                                          ctrl.homeFeatureRadio.subTitleText =
                                              value!;
                                          ctrl.update();
                                        },
                                      ),
                                    ],
                                  ).paddingOnly(left: 15, right: 6))
                            ]),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isGarageSpots,
                            onExpansionChanged: (bool val) {
                              ctrl.isGarageSpots = !ctrl.isGarageSpots;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                garageText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w500, size: 16),
                                ctrl.isGarageSpots
                                    ? "500/Month".appBlackText1B1B1B(
                                        fontWeight: FontWeight.w400, size: 14)
                                    : (0.0).addHSpace(),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: ctrl.garageSpotList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) => homeTypeTextCard(
                                          onTap: () {
                                            ctrl.onGarageCardTypeTap(i);
                                          },
                                          borderColor:
                                              ctrl.garageSpotList[i].isSeleacted
                                                  ? app_Orange_FF7448
                                                  : null,
                                          child: ctrl
                                              .garageSpotList[i].subTitleText
                                              .appColorChangeText(
                                                  size: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: ctrl.garageSpotList[i]
                                                          .isSeleacted
                                                      ? app_Orange_FF7448
                                                      : app_grey_99A7AE)
                                              .paddingSymmetric(
                                                  horizontal: 27, vertical: 12))
                                      .paddingOnly(right: 8),
                                ),
                              ).paddingSymmetric(horizontal: 20),
                              (10.0).addHSpace(),
                              ...ctrl.garageSpotSelectList.map((e) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      e.subTitleText.appBlackText1B1B1B(
                                          size: 16,
                                          fontWeight: FontWeight.w400),
                                      appCheckBox(
                                          value: e.isSeleacted,
                                          onChanged: (bool? val) {
                                            e.isSeleacted = !e.isSeleacted;
                                            ctrl.update();
                                          })
                                    ],
                                  ).paddingOnly(left: 15, right: 8))
                            ]),
                        (10.0).addHSpace(),
                        Divider(
                          color: app_divider_E1EBF0,
                        ),
                        (10.0).addHSpace(),
                        costFinanceText
                            .appBlackText1B1B1B(
                                fontWeight: FontWeight.w600, size: 16)
                            .paddingSymmetric(horizontal: 20),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isHqaFees,
                            onExpansionChanged: (bool val) {
                              ctrl.isHqaFees = !ctrl.isHqaFees;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                hqaFeesText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w500, size: 16),
                                ctrl.isHqaFees
                                    ? "\$500/Month".appBlackText1B1B1B(
                                        fontWeight: FontWeight.w400, size: 14)
                                    : (0.0).addHSpace(),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              SizedBox(
                                height: 150,
                                child: appCupertinoPicker(
                                  selectionOverlayWidget: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            app_Orange_FF7448.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  childrenList: ctrl.hqaFeesList
                                      .map((e) => Center(
                                            child: e.subTitleText
                                                .appColorChangeText(
                                                    color: e.isSeleacted
                                                        ? app_Orange_FF7448
                                                        : app_grey_99A7AE,
                                                    size: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ))
                                      .toList(),
                                  onSelectedItemChanged: (int index) {
                                    for (var data in ctrl.hqaFeesList) {
                                      data.isSeleacted = false;
                                      ctrl.hqaFeesList[index].isSeleacted =
                                          true;
                                      ctrl.update();
                                    }
                                  },
                                ),
                              ).paddingOnly(left: 15, right: 10),
                            ]),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isPropertyText,
                            onExpansionChanged: (bool val) {
                              ctrl.isPropertyText = !ctrl.isPropertyText;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                propertyTaxText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w500, size: 16),
                                ctrl.isPropertyText
                                    ? "\$500/Month".appBlackText1B1B1B(
                                        fontWeight: FontWeight.w400, size: 14)
                                    : (0.0).addHSpace(),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              SizedBox(
                                height: 150,
                                child: appCupertinoPicker(
                                  selectionOverlayWidget: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            app_Orange_FF7448.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  childrenList: ctrl.propertyTexList
                                      .map((e) => Center(
                                            child: e.subTitleText
                                                .appColorChangeText(
                                                    color: e.isSeleacted
                                                        ? app_Orange_FF7448
                                                        : app_grey_99A7AE,
                                                    size: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ))
                                      .toList(),
                                  onSelectedItemChanged: (int index) {
                                    for (var data in ctrl.propertyTexList) {
                                      data.isSeleacted = false;
                                      ctrl.propertyTexList[index].isSeleacted =
                                          true;
                                      ctrl.update();
                                    }
                                  },
                                ),
                              ).paddingOnly(left: 15, right: 10),
                            ]),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isCostYearBuilt,
                            onExpansionChanged: (bool val) {
                              ctrl.isCostYearBuilt = !ctrl.isCostYearBuilt;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                (ctrl.currentIndex.value == 2
                                        ? priceSquareFitText
                                        : yearBuiltText)
                                    .appBlackText1B1B1B(
                                        fontWeight: FontWeight.w500, size: 16),
                                ctrl.isCostYearBuilt
                                    ? "\$150-\$150 per sq ft"
                                        .appBlackText1B1B1B(
                                            fontWeight: FontWeight.w400,
                                            size: 14)
                                    : (0.0).addHSpace(),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl
                                            .yearBuiltCostFinnanceList
                                            .map((e) => Center(
                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data in ctrl
                                              .yearBuiltCostFinnanceList) {
                                            data.isSeleacted = false;
                                            ctrl
                                                .yearBuiltCostFinnanceList[
                                                    index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: appCupertinoPicker(
                                        selectionOverlayWidget: Container(
                                          decoration: BoxDecoration(
                                              color: app_Orange_FF7448
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              )),
                                        ),
                                        childrenList: ctrl
                                            .yearBuiltCostFinnanceList2
                                            .map((e) => Center(
                                                  child: e.subTitleText
                                                      .appColorChangeText(
                                                          color: e.isSeleacted
                                                              ? app_Orange_FF7448
                                                              : app_grey_99A7AE,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          for (var data in ctrl.yearBuiltCostFinnanceList2) {
                                            data.isSeleacted = false;
                                            ctrl.yearBuiltCostFinnanceList2[index]
                                                .isSeleacted = true;
                                            ctrl.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 14),
                            ]),
                        ctrl.currentIndex.value == 2
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (10.0).addHSpace(),
                                  acceptedFinancing
                                      .appBlackText1B1B1B(

                                          fontWeight: FontWeight.w600, size: 16)
                                      .paddingSymmetric(
                                          horizontal: 20, vertical: 5),
                                  ...ctrl.acceptedFinancingList
                                      .map((e) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,

                                            children: [
                                              e.subTitleText.appBlackText1B1B1B(
                                                  size: 16,
                                                  fontWeight: FontWeight.w400),
                                              appCheckBox(
                                                  value: e.isSeleacted,
                                                  onChanged: (bool? val) {
                                                    e.isSeleacted =
                                                        !e.isSeleacted;
                                                    ctrl.update();
                                                  })
                                            ],
                                          ).paddingOnly(
                                            left: 20,
                                            right: 15,
                                          ))
                                      .toList(),
                                  (10.0).addHSpace(),
                                ],
                              )
                            : (0.0).addHSpace(),
                        Divider(
                          color: app_divider_E1EBF0,
                        ),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isListingType,
                            onExpansionChanged: (bool val) {
                              ctrl.isListingType = !ctrl.isListingType;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                listingTypeText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w600, size: 16),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              ...ctrl.listingTypeList.map((e) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      e.subTitleText == "By Owner"
                                          ? e.subTitleText.appGreyText(
                                              size: 16,
                                              fontWeight: FontWeight.w400)
                                          : e.subTitleText.appBlackText1B1B1B(
                                              size: 16,
                                              fontWeight: FontWeight.w400),
                                      e.subTitleText == "By Owner"
                                          ? appCheckBox(
                                              value: ctrl.listingTypeList[2]
                                                  .isSeleacted,
                                              onChanged: (bool? val) {
                                                ctrl.listingTypeList[2]
                                                        .isSeleacted =
                                                    !ctrl.listingTypeList[2]
                                                        .isSeleacted;
                                                ctrl.update();
                                              }).paddingOnly(right: 3)
                                          : Radio<String>(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              value: e.subTitleText,
                                              groupValue: ctrl.listingTypeRadio
                                                  .subTitleText,
                                              fillColor: MaterialStateColor
                                                  .resolveWith((states) =>
                                                      app_Orange_FF7448),
                                              //<-- SEE HERE
                                              onChanged: (String? value) {
                                                ctrl.listingTypeRadio
                                                    .subTitleText = value!;
                                                ctrl.update();
                                              },
                                            )
                                    ],
                                  ).paddingOnly(left: 15, right: 6)),
                            ]),
                        Divider(
                          color: app_divider_E1EBF0,
                        ),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isSchoolType,
                            onExpansionChanged: (bool val) {
                              ctrl.isSchoolType = !ctrl.isSchoolType;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                schoolsText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w600, size: 16),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  "Great School ratting".appBlackText1B1B1B(
                                      size: 16, fontWeight: FontWeight.w400),
                                  "0+".appBlackText1B1B1B(
                                      size: 14, fontWeight: FontWeight.w500),
                                ],
                              ).paddingOnly(left: 15, right: 12),
                              AppTextFields(
                                controller: ctrl.schoolRatingController,
                                hintText: 'School Rating',
                                fillColor: Colors.transparent,
                                isSecureEntry: false,
                                borderColor: app_grey_E3EAEE,
                               
                              ).paddingSymmetric(horizontal: 15,vertical: 10),
                              // SizedBox(
                              //   height: 80,
                              //   child: appSimpleSlider(
                              //       context: context,
                              //       rangeThumbShape:
                              //           ctrl.schoolRatingSliderThumbShape,
                              //       priceStartValue:
                              //           ctrl.schoolRatingValueStart,
                              //       // priceEndValue: ctrl.schoolRatingEndValue,
                              //       onChanged: (val) {
                              //         ctrl.onSchoolRatingChange(val);
                              //
                              //       }).paddingSymmetric(horizontal: 12),
                              // ),
                            ]),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isWalkScore,
                            onExpansionChanged: (bool val) {
                              ctrl.isWalkScore = !ctrl.isWalkScore;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                walkScoreText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w600, size: 16),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  walkScoreText.appBlackText1B1B1B(
                                      size: 16, fontWeight: FontWeight.w400),
                                  Row(
                                    children: [
                                      "0/100 ".appBlackText1B1B1B(
                                          size: 14,
                                          fontWeight: FontWeight.w500),
                                      "car-dependent".appGreyText(
                                          size: 14,
                                          fontWeight: FontWeight.w500),
                                    ],
                                  )
                                ],
                              ).paddingOnly(left: 15, right: 12),
                              SizedBox(
                                height: 80,
                                child: appSimpleSlider(
                                    context: context,
                                    rangeThumbShape:
                                        ctrl.walkScoreSliderThumbShape,
                                    priceStartValue: ctrl.walkScoreValueStart,
                                    // priceEndValue: ctrl.walkScoreValueEndValue,
                                    onChanged: (val) {
                                      ctrl.onWalkRatingChange(val);
                                      // ctrl.onWalkIndicatorRangeChange(
                                      //     val.start, val.end);
                                    }).paddingSymmetric(horizontal: 12),
                              ),
                            ]),
                        Divider(
                          color: app_divider_E1EBF0,
                        ),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isOpenHouse,
                            onExpansionChanged: (bool val) {
                              ctrl.isOpenHouse = !ctrl.isOpenHouse;
                              ctrl.update();
                            },
                            tileTileWidget: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                openHouseText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w600, size: 16),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              ...ctrl.openHouseTourList.map((e) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      e.subTitleText.appBlackText1B1B1B(
                                          size: 16,
                                          fontWeight: FontWeight.w400),
                                      appCheckBox(
                                          value: e.isSeleacted,
                                          onChanged: (bool? val) {
                                            e.isSeleacted = !e.isSeleacted;
                                            ctrl.update();
                                          }).paddingOnly(right: 3)
                                    ],
                                  ).paddingOnly(left: 15, right: 6)),
                              10.0.addHSpace(),
                            ]),
                        Divider(
                          color: app_divider_E1EBF0,
                        ),
                        AppExpansionTile(
                            context: context,
                            isExpanded: ctrl.isKeyWordSearch,
                            onExpansionChanged: (bool val) {
                              ctrl.isKeyWordSearch = !ctrl.isKeyWordSearch;
                              ctrl.update();
                            },
                            tileTileWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                keyWordSearchText.appBlackText1B1B1B(
                                    fontWeight: FontWeight.w600, size: 16),
                              ],
                            ).paddingOnly(left: 4),
                            childrenWidgetList: [
                              AppTextFields(
                                controller: ctrl.keyWordSearchController,
                                hintText: '',
                                fillColor: Colors.transparent,
                                isSecureEntry: false,
                                borderColor: app_grey_E3EAEE,
                              ).paddingSymmetric(horizontal: 16),
                            ]),
                      ],
                    )
                  : 0.0.addHSpace(),
              (50.0).addHSpace(),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      unselected: true,
                      onTap: () {},
                      text: resetAllText.toUpperCase(),
                      radius: 30,
                      textFontWeight: FontWeight.w600,
                    ),
                  ),
                  (10.0).addWSpace(),
                  Expanded(
                    child: AppButton(
                      unselected: false,
                      onTap: () {},
                      text: "See 85 homes",
                      radius: 30,
                      textFontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20),
              (50.0).addHSpace()
            ],
          ),
        );
      }),
    );
  }
}
