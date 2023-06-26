import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../theme/app_colors.dart';

class PropertyTypeBottomSheet extends StatelessWidget {
  PropertyTypeBottomSheet({Key? key}) : super(key: key);

  SearchScreenController searchController = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
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


              Container(
                width: 70,
                height: 4,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    shape: BoxShape.rectangle,
                    color: const Color(0xffC5CFD3)),
              ),

              Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  "Property Type".appBlackText1B1B1B(
                      size: 20, fontWeight: FontWeight.w600),

                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(closeIcon, height: 25)),
                ],
              ).paddingOnly( top: 20,bottom: 10,right: 10),

                SingleChildScrollView(

                  child: Column(
                    children: [
                      ...ctrl.propertyTypeList.map((e) => Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [

                          e.subTitleText.appBlackText1B1B1B(
                              size: 16, fontWeight: FontWeight.w500),
                          Radio<String>(
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            value: e.subTitleText,
                            groupValue:
                            ctrl.propertyType.subTitleText,
                            fillColor:
                            MaterialStateColor.resolveWith(
                                    (states) => app_Orange_FF7448),
                            //<-- SEE HERE
                            onChanged: (String? value) {
                              ctrl.propertyType.subTitleText = value!;
                              ctrl.update();
                            },
                          ),
                        ],
                      ).paddingOnly(left: 0, right: 0,)),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 20, top: 10),
                        child: AppButton(
                          onTap: () async{
                            Get.back();
                            ctrl.manager = await  ctrl.initClusterManager();
                            ctrl.manager!.setMapId(ctrl.mapController.mapId);
                          },
                          text: "SEE 85 HOMES",
                          textSize: 16,
                          textFontWeight: FontWeight.w600,
                          radius: 50,
                        ),
                      )
                    ],
                  ),
                )
              // (30.0).addHSpace(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     "Single Family Home".toString().appBlackText1B1B1B(
              //         size: 16, fontWeight: FontWeight.w500),
              //     SizedBox(
              //       width: 15,
              //       height: 15,
              //       child: Checkbox(
              //         value: ctrl.singleFamilyHomeCheckBox,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(2),
              //           ),
              //         ),
              //         fillColor: MaterialStatePropertyAll(app_Orange_FF7448),
              //         onChanged: (value) {
              //           ctrl.singleFamilyHomeCheckBox = value!;
              //           ctrl.update();
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // (10.0).addHSpace(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     "Condo".toString().appBlackText1B1B1B(
              //         size: 16, fontWeight: FontWeight.w500),
              //     SizedBox(
              //       width: 15,
              //       height: 15,
              //       child: Checkbox(
              //         value: ctrl.condoCheckBox,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(2),
              //           ),
              //         ),
              //         fillColor: MaterialStatePropertyAll(app_Orange_FF7448),
              //         onChanged: (value) {
              //
              //           ctrl.condoCheckBox = value!;
              //           ctrl.update();
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // (10.0).addHSpace(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //
              //     "Townhome".toString().appBlackText1B1B1B(
              //         size: 16, fontWeight: FontWeight.w500),
              //     SizedBox(
              //       width: 15,
              //       height: 15,
              //       child: Checkbox(
              //         value: ctrl.townhomeCheckBox,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(2),
              //           ),
              //         ),
              //         fillColor: MaterialStatePropertyAll(app_Orange_FF7448),
              //         onChanged: (value) {
              //           ctrl.townhomeCheckBox = value!;
              //           ctrl.update();
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // (10.0).addHSpace(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     "Multi Family Home".toString().appBlackText1B1B1B(
              //         size: 16, fontWeight: FontWeight.w500),
              //     SizedBox(
              //
              //       width: 15,
              //       height: 15,
              //       child: Checkbox(
              //         value: ctrl.multiFamilyHomeCheckBox,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(
              //
              //             Radius.circular(2),
              //           ),
              //         ),
              //         fillColor: MaterialStatePropertyAll(app_Orange_FF7448),
              //         onChanged: (value) {
              //
              //           ctrl.multiFamilyHomeCheckBox = value!;
              //           ctrl.update();
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // (10.0).addHSpace(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     "Mobile".toString().appBlackText1B1B1B(
              //
              //         size: 16, fontWeight: FontWeight.w500),
              //     SizedBox(
              //       width: 15,
              //       height: 15,
              //       child: Checkbox(
              //         value: ctrl.mobileCheckBox,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(2),
              //           ),
              //         ),
              //         fillColor: MaterialStatePropertyAll(app_Orange_FF7448),
              //         onChanged: (value) {
              //           ctrl.mobileCheckBox = value!;
              //           ctrl.update();
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // (10.0).addHSpace(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     "Farm".toString().appBlackText1B1B1B(
              //         size: 16, fontWeight: FontWeight.w500),
              //     SizedBox(
              //       width: 15,
              //       height: 15,
              //       child: Checkbox(
              //         value: ctrl.farmCheckBox,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(
              //
              //             Radius.circular(2),
              //           ),
              //         ),
              //         fillColor: MaterialStatePropertyAll(app_Orange_FF7448),
              //         onChanged: (value) {
              //           ctrl.farmCheckBox = value!;
              //           ctrl.update();
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // (10.0).addHSpace(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     "Land".toString().appBlackText1B1B1B(
              //         size: 16, fontWeight: FontWeight.w500),
              //     SizedBox(
              //       width: 15,
              //       height: 15,
              //       child: Checkbox(
              //         value: ctrl.lanCheckBox,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(2),
              //           ),
              //         ),
              //         fillColor: MaterialStatePropertyAll(app_Orange_FF7448),
              //         onChanged: (value) {
              //           ctrl.lanCheckBox = value!;
              //           ctrl.update();
              //         },
              //       ),
              //     ),
              //
              //   ],
              // ),


            ],
          ),
        ),
      ),
    );
  }
}
