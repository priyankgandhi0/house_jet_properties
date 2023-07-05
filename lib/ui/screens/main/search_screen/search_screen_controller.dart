import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart' ;
import 'package:get/get.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_jet_properties/api/repositories/home_screen_repo.dart';
import 'package:house_jet_properties/constants/request_const.dart';
import 'package:house_jet_properties/models/home_type_model.dart';

import 'package:house_jet_properties/models/properties_detail_model.dart';
import 'package:house_jet_properties/models/properties_model.dart';
import 'package:house_jet_properties/models/response_item_model/response_item.dart';
import 'package:house_jet_properties/theme/app_colors.dart';
import 'package:house_jet_properties/ui/widgets/app_price_slider.dart';
import 'package:house_jet_properties/ui/widgets/bottom_sheet/bed_bath_filter_bottomsheet.dart';
import 'package:house_jet_properties/ui/widgets/bottom_sheet/price_filter_bottomsheet.dart';
import 'package:house_jet_properties/ui/widgets/bottom_sheet/property_type_bottomsheet.dart';
import 'package:house_jet_properties/ui/widgets/marker_detail_card.dart';
import 'package:house_jet_properties/utils/app_routes.dart';
import 'package:house_jet_properties/utils/extension.dart';
import 'package:house_jet_properties/utils/map_utils.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_place/google_place.dart' as googleplace;

class SearchScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() async{
    googlePlace = googleplace.GooglePlace(googlePlaceApiKey);
     setData();
    configTabBar();
    configCall();
    // _getPlaces();
    manager = await initClusterManager();
    super.onInit();
  }







  bool hasCallSupport = false;
  Future<void>? launched;
  String phone = '';
  RxBool showLoading = false.obs;



  configCall(){
    canLaunchUrl(
        Uri(scheme: 'tel', path: '123')).then((bool result) {
      hasCallSupport = result;
      update();
    });
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);

  }

  configTabBar() {
    tabController = TabController(


      vsync: this,
      length: 3,
    );

    tabController.addListener(() {
      currentIndex.value = tabController.index;

      update();
    });
  }

  late TabController tabController;

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  final CameraPosition cameraPosition = const CameraPosition(
      // target: LatLng(21.1702, 72.8311), zoom: 12.8, bearing: 0, tilt: 0);

      target:     LatLng(37.134548, -93.324819),
      //LatLng(21.2266 + 1 * 0.001, 72.8312 - 1 * 0.001),
      zoom: 10.8,
      bearing: 0,
      tilt: 0);

      GoogleMapController? mapController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PropertiesModel? propertiesDetailModel;
  PropertyByAlias? propertiesDetailByAliasName;
  Timer? debounce;
  List<PropertiesModel> propertiesDetailList = [];
  List<PropertiesModel> searchTempList = [];
  TextEditingController searchFiledController = TextEditingController();
  TextEditingController scheduleTimeCtr = TextEditingController();
  Set<Marker> markers = {};
  Map<MarkerId, Marker> markers2 = <MarkerId, Marker>{};
   ClusterManager? manager;
  Position? currentPosition;
  HomeTypeModel propertyType = HomeTypeModel();
  int imageSliderIndex = 0;
  String selectedMarkerId = "";
  int selectedMarkerIndex = 0;
  int filterIndex = 0;

  int filterBedroomIndex = 0;
  int filterBathroomIndex = 0;

  double priceStartValue = 18;

  double priceEndValue = 300;

  bool mapList = false;
  bool isBottomSheetOpen = false;

  bool singleFamilyHomeCheckBox = false;
  bool condoCheckBox = false;
  bool townhomeCheckBox = false;
  bool multiFamilyHomeCheckBox = false;
  bool mobileCheckBox = false;
  bool farmCheckBox = false;
  bool lanCheckBox = false;

  bool viewAsGoogleMap = true;

  List filterTextList = ["Filter", "Price", "Bed/Bath", "Property"];

  List bedBathList = ["Any", "01", "02", "03", "4+"];
  // List propertyTypeList = [
  //   "Single Family Home",
  //   "Condo",
  //   "Townhome",
  //   "Multi Family Home",
  //   "Mobile",
  //   "Farm",
  //   "Land"
  // ];

  List<HomeTypeModel> propertyTypeList = [
    HomeTypeModel(
      subTitleText: "Single Family Home",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Condo",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Townhome",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Multi Family Home",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Mobile",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Farm",
      isSeleacted: true,
    ),HomeTypeModel(
      subTitleText: "Land",
      isSeleacted: true,
    ),
  ];

  RxList<googleplace.AutocompletePrediction> predictions = <googleplace.AutocompletePrediction>[].obs;
  RxList<googleplace.AutocompletePrediction> recentViewedList = <googleplace.AutocompletePrediction>[].obs;
  googleplace.GooglePlace? googlePlace;
  TextEditingController addressController = TextEditingController();
  List<googleplace.AutocompletePrediction>? result;

  void autoCompleteSearch(String value) async {
    var result = await googlePlace!.autocomplete.get(value);
    if (result != null && result.predictions != null) {
      predictions.clear();
      print("--------------------------------------------------------------------------------------------->(*)");

        print(result.predictions!.length);

      print("--------------------------------------------------------------------------------------------->(*)");
      predictions.addAll(result.predictions!);
      update();
    }

  }
  resultSearch(String val) {

    searchTempList = propertiesDetailList
        .where((data) => data.alias!.toLowerCase().contains(val.toLowerCase()))
        .toList();

    update();
  }
  RxInt currentIndex = 0.obs;

  onIndexChange(int index) {
    currentIndex.value = index;
    update();
  }

  late IndicatorRangeSliderThumbShape<int> indicatorRangeSliderThumbShape =
      IndicatorRangeSliderThumbShape(
          priceStartValue.toInt(), priceEndValue.toInt());

  onPriceRangeChange(double start, double end) {

    priceStartValue = start;
    priceEndValue = end;
    update();
  }

  onIndicatorRangeChange(double start, double end) {
    indicatorRangeSliderThumbShape.start = start.toInt();
    indicatorRangeSliderThumbShape.end = end.toInt();

    update();
  }

  onBottomSheetOpen() {
    isBottomSheetOpen = !isBottomSheetOpen;
    update();
  }

  onViewTypeChange() {

    viewAsGoogleMap = !viewAsGoogleMap;
    update();
  }

  onImageChange(int index) {
    //carouselController.
    imageSliderIndex = index;
    update();
  }

  onViewGoogleMap() {
    viewAsGoogleMap = !viewAsGoogleMap;
    update();
  }

  onFilterClick(int index) {
    filterIndex = index;
    update();
  }

  onBedroomFilterClick(int index) {
    filterBedroomIndex = index;
    update();
  }

  onBathroomFilterClick(int index) {

    filterBathroomIndex = index;
    update();
  }

  onPropertyTypeCheckBoxClick(int index) {
    switch (index) {
      case 0:
        singleFamilyHomeCheckBox = !singleFamilyHomeCheckBox;
        break;
      case 1:
        condoCheckBox = !condoCheckBox;
        break;
      case 2:
        townhomeCheckBox = !townhomeCheckBox;
        break;
    }
    update();
  }

  onFilterClickOpenBottomSheet() {
    switch (filterIndex) {
      case 0:
        Get.toNamed(Routes.filterScreen);
        break;
      case 1:

        Get.bottomSheet(PriceFilterBottomSheet());
        break;
      case 2:
        Get.bottomSheet(BedBathFilterBottomSheet());
        break;

      default:
        Get.bottomSheet(PropertyTypeBottomSheet());
        break;
    }
    update();
  }



  getLocationData(String address)async{

    print("Address -------> $address");
    List<Location> locations = await locationFromAddress(address);
         print("Location -------> ${locations.first.latitude} --- ${locations.first.longitude}");

    print("Locations int the Second Change ---> $locations");
    return LatLng(locations.first.latitude, locations.first.longitude);


  }

  setToRecentData(int index){
    if(recentViewedList.isNotEmpty && !recentViewedList.any((c) => c.placeId == predictions[index].placeId)){
      recentViewedList.insert(0, predictions[index]);
    }if(recentViewedList.isNotEmpty && recentViewedList.any((c) => c.placeId == predictions[index].placeId)){
      recentViewedList.removeWhere((m) => m.placeId == predictions[index].placeId);
      recentViewedList.insert(0, predictions[index]);
    }
    else if(recentViewedList.isEmpty){
      recentViewedList.add(predictions[index]);
    }

    print("Recent List ---> ${recentViewedList.value.length}");
    List<String> seleactedData = recentViewedList.map((e) {
      return jsonEncode(e.toJson());
    }).toList();
     preferences.putList(SharedPreference.RECENTLY_VIEWED_LIST, seleactedData);

      update();

  }

  setData() {

    List<String> getRecentData =
        preferences.getList(SharedPreference.RECENTLY_VIEWED_LIST) ?? [];

    if (getRecentData.isNotEmpty) {
      recentViewedList.value = getRecentData.map((e) => googleplace.AutocompletePrediction.fromJson(jsonDecode(e))).toList();
    }
  }
  clearAllRecently({bool isForRecently = true,BuildContext? context}){
    if(isForRecently){
     recentViewedList.clear();
      preferences.putList(SharedPreference.RECENTLY_VIEWED_LIST, []);
    }else{
      FocusScope.of(context!).unfocus();
      searchFiledController.clear();
      predictions.clear();

    }

    update();
  }


  setInfoWindowModel(PropertiesModel? placeDetail,
      {bool isFormDrag = false, int? index})async {
    // placeDetailes = placeDetail;
    propertiesDetailModel = placeDetail;

    // new one
    if(placeDetail != null){

      print("Address ===> ${placeDetail.streetAddress}");

      isFormDrag ? mapController!.animateCamera(
        // CameraUpdate.newCameraPosition(
        //   CameraPosition(
        //     target:  LatLng(propertiesDetailModel!.lat, propertiesDetailModel!.long),
        //     zoom: 15.0,
        //     tilt: 5.0
        //   ),
        //
        //
        // ),

          CameraUpdate.newLatLngZoom(LatLng(propertiesDetailModel!.latitude!, propertiesDetailModel!.longitude!), 15.0)

      ):null;
    }





    if (isFormDrag) {
      selectedMarkerId = placeDetail!.id.toString();
    }

    update();
  }

  void _showMarkers(Set<Marker> newMarkers) {
    if (kDebugMode) {
      print('Updated ${newMarkers.length} markers');
    }
    markers = newMarkers;
    update();

  }



  Future<ClusterManager<ClusterItem>> initClusterManager() async{
    await getAllProperties();
    return ClusterManager<PropertiesModel>(
      propertiesDetailList,
      _showMarkers,
      levels: [
        1,
        4.25,
        6.75,
        8.25,
        10.0,
        12.5,
        15.0,

      ],
      stopClusteringZoom: 15.0,
      // extraPercent: 0.1,
      markerBuilder: markerBuilder,
    );
  }


/*  _getPlaces() {
    Properties data = Properties(data: propertyDetailes);
    for (int i = 0; i < data.data.length; i++) {
      placeList.add(
        Place(
            name: data.data[i].name,
            address: data.data[i].address,
            lat: data.data[i].lat,
            lang: data.data[i].lang),
      );
    }
  }*/



  Future<void> launchingUrl(double lat, double lng) async {
    if (Platform.isAndroid) {

      // if (!await launchUrl(Uri.parse("google.navigation:q=$lat,$lng"))) {
      if (!await launchUrl(Uri.parse(
          "https://www.google.com/maps/search/?api=1&query=$lat,$lng"))) {
        throw Exception(
            'Could not launch ${"google.navigation:q=$lat,$lng&mode=d"}');
      }
    }
    if (Platform.isIOS) {
      if (!await launchUrl(Uri.parse("https://maps.apple.com/?q=$lat,$lng"))) {
        throw Exception(
            'Could not launch ${"https://maps.apple.com/?q=$lat,$lng&mode=d"}');
      }
    }
  }
  List<LatLng> latLen = [

   LatLng(34.2188174,-118.574612),
   LatLng(34.219768,-118.5828756),
   LatLng(34.2247554,-118.6000859),
   LatLng(34.2391913,-118.6078768),
   LatLng(34.2564872,-118.617112),
   LatLng(34.27916,-118.606056),
   LatLng(34.2986712,-118.584522),
   LatLng(34.2962003,-118.5609489),
   LatLng(34.2871879,-118.5518242),
   LatLng(34.2321442,-118.5450906),
   LatLng(34.2261774,-118.5510262),
   LatLng(34.2197353,-118.5689503),
   LatLng(34.2188174,-118.574612),

  ];




  setStartCap()async{
    return  Polyline(
    polylineId: const PolylineId('1'),
    points: latLen,
    width: 1,

    // patterns: [
    //   PatternItem.dot,
    //   PatternItem.dash(1),
    //   PatternItem.gap(1)],
    patterns: [
    PatternItem.dash(8),
    PatternItem.gap(8),
    ],
    startCap: Cap.customCapFromBitmap(await MapUtils().getMarkerImage(
    const Size(200.0, 200.0)

    // id: selectedMarkerId == cluster.getId() ||
    //         selectedMarkerId == cluster.items.first.id.toString()
    //     ? selectedMarkerId
    //          : null

    ) ),

    color: app_Orange_FF7448,

    );

  }

  Future<Marker> Function(Cluster<PropertiesModel>) get markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          anchor: const ui.Offset(0.5, 1),
          flat: false,
          draggable: true,
          onTap: () async {
            selectedMarkerId = cluster.getId();
            update();
            if (cluster.isMultiple) {
              List<LatLng> latLon = [];
              for (var p in cluster.items) {
                latLon.add(LatLng(p.latitude!, p.longitude!));
              }
              LatLngBounds bound = MapUtils().computeBounds(latLon);
              mapController!.animateCamera(CameraUpdate.newLatLngBounds(bound, 60));
            } else {

              // List<LatLng> latLon = [];
              // for (var p in cluster.items) {
              //   latLon.add(p.latLng);
              // }

              // setInfoWindowModel(cluster.items.first);
              setInfoWindowModel(cluster.items.first,isFormDrag: true);
              onBottomSheetOpen();
              scaffoldKey.currentState?.showBottomSheet(
                backgroundColor: Colors.transparent,
                (context) => InkWell(
                  onTap: () {
                    // getNearbyLatLong(
                    //     lat: cluster.items.first.lat,
                    //     lang: cluster.items.first.long);
                    imageSliderIndex = 0;
                    if(preferences.getBool(SharedPreference.IS_LOGGED_IN) ?? false){
                      Get.toNamed(Routes.propertyDetailScreen,arguments:propertiesDetailModel!.alias);
                    }else{
                      Get.toNamed(Routes.loginScreen);
                    }


                  },
                  child: MarkerDetailCard(),
                ),
              );
            }
          },
          icon: cluster.isMultiple
              ? await MapUtils().getClusterImages(
                  150,
                  text: cluster.count == 0 ? null : cluster.count.toString(),
                )
              : await MapUtils().getMarkerImage(
                  selectedMarkerId == cluster.getId() ||
                          selectedMarkerId == cluster.items.first.id.toString()
                      ? const Size(200.0, 200.0)
                      : const Size(150.0, 150.0),
                  // id: selectedMarkerId == cluster.getId() ||
                  //         selectedMarkerId == cluster.items.first.id.toString()
                  //     ? selectedMarkerId
                  //          : null
                ),
        );
      };

  ///for Custom Current Location Button
  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      mapController!.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(currentPosition!.latitude, currentPosition!.longitude),
        ),
      );
      markers.add(
        Marker(
          markerId: const MarkerId("current_location"),
          position:
              LatLng(currentPosition!.latitude, currentPosition!.longitude),
        ),
      );
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showAppSnackBar(
          "Please enable location permission from app setting.", true,true);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showAppSnackBar(
            "Please enable location permission from app setting.", true,true);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showAppSnackBar(
          "Please enable location permission from app setting.", true,true);
      return false;
    }
    return true;
  }






  getAllProperties() async {
    showLoading.value = true;
    update();
    try {
      ResponseItem result;
      result = await homeRepo.getAllProperties(
          bathroomsCount: filterBathroomIndex == 0 ?"01":int.parse(bedBathList[filterBathroomIndex]),
          bedroomsCount: filterBedroomIndex == 0?"01": int.parse(bedBathList[filterBedroomIndex]),
          priceRangeList: [formatNumber(priceStartValue.toInt()),
            formatNumber(priceEndValue.toInt())
            ,],
          subType:propertyType.subTitleText
      );
      GetAllPropertiesModel data = GetAllPropertiesModel.fromJson(result.data);
      if(data.properties != null){
        propertiesDetailList = data.properties!;

        if(mapController!.mapId.toString().isNotEmpty){
          mapController!.animateCamera(
              CameraUpdate.newLatLngZoom(LatLng(propertiesDetailList.first.latitude!, propertiesDetailList.first.longitude!), 15.0)
          ) ;
        }

      }
      showLoading.value = false;
    } catch (e) {
      debugPrint("Catch Data of get all properties ----> $e");
      showLoading.value = false;

    }
    update();
  }
  getPropertiesByAlias(String aliasName) async {
    showLoading.value = true;
    update();
    try {
      ResponseItem result;
      result = await homeRepo.getPropertyByAlias(
          aliasName: aliasName
      );
      PropertyByAlias data = PropertyByAlias.fromJson(result.data["property"]);
      if(data.id != null){
        propertiesDetailByAliasName = data;
      }
      showLoading.value = false;
    } catch (e) {
      debugPrint("Catch Data of properties by alias ----> $e");
      showLoading.value = false;
    }
    update();
  }


}


