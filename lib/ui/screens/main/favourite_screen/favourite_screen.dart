import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/screens/main/properties_detail_screen/properties_detail_screen.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/loading_builder_comon.dart';
import 'package:house_jet_properties/utils/app_routes.dart';
import 'package:house_jet_properties/utils/extension.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';



class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.white,
        //   statusBarIconBrightness: Brightness.dark,
        // ),
        elevation: 5,
        bottomOpacity: 1.0,
        centerTitle: true,
        toolbarHeight: 80,
        shadowColor: Colors.grey.withOpacity(0.15),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: "favorite".darkText(size: 20, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<SearchScreenController>(
        builder: (ctrl) => SizedBox(

          height: Get.height,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (context, index) => InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: () {
                      ctrl.imageSliderIndex = 0;
                      ctrl.setInfoWindowModel(ctrl.propertiesDetailList[index],isFormDrag: false);
                      if(preferences.getBool(SharedPreference.IS_LOGGED_IN) ?? false){
                        Get.toNamed(Routes.propertyDetailScreen,arguments:ctrl.propertiesDetailList[index].alias);
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

                        borderRadius: BorderRadiusDirectional.circular(10),
                        image: DecorationImage(

                            colorFilter:
                            ColorFilter.mode(Colors.black.withOpacity(0.1),
                                BlendMode.darken),
                            image: Image.network(

                                ctrl.propertiesDetailList[index].propertyPhotos!.isNotEmpty ?  ctrl.propertiesDetailList[index].propertyPhotos!.first.mediumUrl!:"",
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                return loadingBuilder(context, child, loadingProgress);
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(housePlaceHolder);
                              },
                            ).image,

                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(

                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50)),
                              child: Padding(

                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(

                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Color(0xff3EE763),
                                    ),
                                    7.0.addWSpace(),
                                    "For Sale".whiteText(
                                        size: 12, fontWeight: FontWeight.w600),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      (ctrl.propertiesDetailList[index].alias??"").whiteText(
                                              size: 18,
                                              fontWeight: FontWeight.w600),
                                      5.0.addHSpace(),
                                      ("\$${ctrl.propertiesDetailList[index].listPrice??""}")
                                          .toString()
                                          .whiteText(

                                              size: 20,
                                              fontWeight: FontWeight.w700),
                                    ],
                                  ),
                                ),
                                Image.asset(likeIcon, height: 22),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => 16.0.addHSpace(),
              itemCount: ctrl.propertiesDetailList.length),
        ),
      ),
    );
  }
}
