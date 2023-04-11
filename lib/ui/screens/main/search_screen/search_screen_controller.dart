import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_jet_properties/models/properties_detail.dart';
import 'package:house_jet_properties/ui/screens/main/properties_detail_screen/properties_detail_screen.dart';
import 'package:house_jet_properties/ui/widgets/app_price_slider.dart';
import 'package:house_jet_properties/ui/widgets/bottom_sheet/bed_bath_filter_bottomsheet.dart';
import 'package:house_jet_properties/ui/widgets/bottom_sheet/price_filter_bottomsheet.dart';
import 'package:house_jet_properties/ui/widgets/bottom_sheet/property_type_bottomsheet.dart';
import 'package:house_jet_properties/ui/widgets/marker_detail_card.dart';
import 'package:house_jet_properties/utils/app_routes.dart';
import 'package:house_jet_properties/utils/extension.dart';
import 'package:house_jet_properties/utils/map_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    configTabBar();
    loadData();
    // _getPlaces();
    manager = _initClusterManager();
    super.onInit();
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
      target: LatLng(21.2266 + 1 * 0.001, 72.8312 - 1 * 0.001),
      zoom: 10.8,
      bearing: 0,
      tilt: 0);

  late GoogleMapController mapController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Place? placeDetailes;

  PropertiesDetailModel? propertiesDetailModel;

  // List<Place> placeList = [];
  // List<Place> nearByProperty = [];

  List<PropertiesDetailModel> propertiesDetailList = [];
  List<PropertiesDetailModel> searchTempList = [];

  TextEditingController searchFiledController = TextEditingController();

  Set<Marker> markers = {};

  Map<MarkerId, Marker> markers2 = <MarkerId, Marker>{};

  late ClusterManager manager;

  Position? currentPosition;

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
  List propertyTypeList = [
    "Single Family Home",
    "Condo",
    "Townhome",
    "Multi Family Home",
    "Mobile",
    "Farm",
    "Land"
  ];

  resultSearch(String val) {
    searchTempList = propertiesDetailList
        .where((data) => data.name.toLowerCase().contains(val.toLowerCase()))
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

  /*void setInfoWindowModel(Place placeDetail) {
    placeDetailes = placeDetail;
    update();
  }*/
  setInfoWindowModel(PropertiesDetailModel placeDetail,
      {bool isFormDrag = false, int? index}) {
    // placeDetailes = placeDetail;
    propertiesDetailModel = placeDetail;
    // new one
    mapController.animateCamera(
      // CameraUpdate.newCameraPosition(
      //   CameraPosition(
      //     target:  LatLng(propertiesDetailModel!.lat, propertiesDetailModel!.long),
      //     zoom: 15.0,
      //     tilt: 5.0
      //   ),
      //
      //
      // ),
        CameraUpdate.newLatLngZoom(LatLng(propertiesDetailModel!.lat, propertiesDetailModel!.long), 15.0)
    );
   // old one
    // mapController.animateCamera(
    //   CameraUpdate.newLatLng(
    //     LatLng(propertiesDetailModel!.lat, propertiesDetailModel!.long),
    //   ),
    // );
    if (isFormDrag) {
      selectedMarkerIndex = index!;
      selectedMarkerId = placeDetail.id.toString();
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

  ClusterManager _initClusterManager() {
    return ClusterManager<PropertiesDetailModel>(
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

  Future loadData() async {
    String jsonString =
        await rootBundle.loadString('assets/json/properties.json');
    final jsonResponse = await json.decode(jsonString);

    for (int i = 0; i < jsonResponse.length; i++) {
      propertiesDetailList.add(PropertiesDetailModel(
          id: jsonResponse[i]["id"],
          name: jsonResponse[i]["name"],
          price: jsonResponse[i]["price"],
          image: jsonResponse[i]["image"],
          isForSale: jsonResponse[i]["is_for_sale"],
          description: jsonResponse[i]["description"],
          bedSize: jsonResponse[i]["bed_size"],
          bathRoomSize: jsonResponse[i]["bath_room_size"],
          squareFt: jsonResponse[i]["square_ft"],
          lat: jsonResponse[i]["lat"],
          long: jsonResponse[i]["long"],
          address: jsonResponse[i]["address"]));
    }
  }

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

  Future<Marker> Function(Cluster<PropertiesDetailModel>) get markerBuilder =>
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
                latLon.add(LatLng(p.lat, p.long));
              }
              LatLngBounds bound = MapUtils().computeBounds(latLon);
              mapController
                  .animateCamera(CameraUpdate.newLatLngBounds(bound, 60));
            } else {
              // List<LatLng> latLon = [];
              // for (var p in cluster.items) {
              //   latLon.add(p.latLng);
              // }

              // setInfoWindowModel(cluster.items.first);
              setInfoWindowModel(cluster.items.first);
              onBottomSheetOpen();
              scaffoldKey.currentState?.showBottomSheet(
                backgroundColor: Colors.transparent,
                (context) => InkWell(
                  onTap: () {
                    // getNearbyLatLong(
                    //     lat: cluster.items.first.lat,
                    //     lang: cluster.items.first.long);
                    imageSliderIndex = 0;
                    Get.to(PropertiesDetail());
                  },
                  child: MarkerDetailCard(),
                ),
              );
/*          Get.bottomSheet(
                InkWell(
                  onTap: () {
                    getNearbyLatLong(
                        lat: cluster.items.first.lat,
                        lang: cluster.items.first.lang);
                    imageSliderIndex = 0;
                    Get.to(PropertiesDetail());
                  },
                  child: MarkerDetailCard(),
                ),
              );*/
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
      mapController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(currentPosition!.latitude, currentPosition!.longitude),
        ),
      );
      markers.add(
        Marker(
          markerId: const MarkerId("current_locatino"),
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
          "Please enable location permission from app setting.", true);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showAppSnackBar(
            "Please enable location permission from app setting.", true);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showAppSnackBar(
          "Please enable location permission from app setting.", true);
      return false;
    }
    return true;
  }

  /*getNearbyLatLong({required double lat, required double lang}) {
    nearByProperty.clear();
    Properties data = Properties(data: propertyDetailes);

    for (var element in data.data) {
      final distanceInMeters =
      Geolocator.distanceBetween(lat, lang, element.lat, element.lang);

      if (distanceInMeters / 1000 < 5 && lat != element.lat) {
        nearByProperty.add(
          Place(
              name: element.name,
              address: element.address,
              lat: element.lat,
              lang: element.lang),
        );
      }
    }
  }*/


}


