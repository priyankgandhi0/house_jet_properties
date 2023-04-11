import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_button.dart';
import 'package:house_jet_properties/utils/extension.dart';

import '../../../theme/app_colors.dart';


class PriceFilterBottomSheet extends StatelessWidget {
  PriceFilterBottomSheet({Key? key}) : super(key: key);

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
              20.0.addHSpace(),
              Stack(
                alignment: Alignment.center,
                children: [
                  "Price Range".appBlackText1B1B1B(
                      size: 20, fontWeight: FontWeight.w600),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(closeIcon, height: 25)),
                  ),
                ],
              ),
              20.0.addHSpace(),
              SliderTheme(
                data: Theme.of(context).sliderTheme.copyWith(
                    inactiveTrackColor: const Color(0xffC8D9E1),
                    rangeThumbShape: ctrl.indicatorRangeSliderThumbShape,
                    showValueIndicator: ShowValueIndicator.never),
                child: RangeSlider(
                  values: RangeValues(ctrl.priceStartValue, ctrl.priceEndValue),
                  onChanged: (values) {
                    ctrl.onIndicatorRangeChange(values.start, values.end);
                    ctrl.onPriceRangeChange(values.start, values.end);
                  },
                  min: 18,
                  max: 300,
                  activeColor: app_Orange_FF7448,
                ),
              ),
              20.0.addHSpace(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
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
