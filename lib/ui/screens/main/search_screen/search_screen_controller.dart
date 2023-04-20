import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_jet_properties/models/properties_detail.dart';
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

class SearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    configTabBar();
    loadData();
    configCall();
    // _getPlaces();
    manager = _initClusterManager();
    super.onInit();
  }

  bool hasCallSupport = false;
  Future<void>? launched;
  String phone = '';

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
  TextEditingController scheduleTimeCtr = TextEditingController();
  Set<Marker> markers = {};


  Map<MarkerId, Marker> markers2 = <MarkerId, Marker>{};

  late ClusterManager manager;

  Position? currentPosition;

  Set<Polygon> polygon = {};
  Set<Circle> circles = {};

  LatLng? cicleMark;

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


  getLocationData(String address)async{

    print("Address -------> $address");
    List<Location> locations = await locationFromAddress(address);

    print("Location -------> ${locations.first.latitude} --- ${locations.first.longitude}");

    print("Locations int the Second Change ---> $locations");
    return LatLng(locations.first.latitude, locations.first.longitude);


  }

  setInfoWindowModel(PropertiesDetailModel? placeDetail,
      {bool isFormDrag = false, int? index})async {
    // placeDetailes = placeDetail;
    propertiesDetailModel = placeDetail;



    // new one
    if(placeDetail != null){

      print("Address ===> ${placeDetail.address}");

      circles = {
        Circle(
          circleId: const CircleId("myCircle"),
          radius: 500,
          center:await getLocationData(placeDetail.address),
          fillColor: app_Orange_FF7448.withOpacity(0.1),
          strokeColor: app_Orange_FF7448,
          onTap: () {
            print('circle pressed');
          })

      };

      isFormDrag ? mapController.animateCamera(
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
      ):null;
    }

    // LatLngBounds visibleRegion =  await mapController.getVisibleRegion();
    // polygon = {
    //   Polygon(
    //       polygonId: const PolygonId("1"),
    //
    //
    //
    //
    //       points:   [
    //         LatLng(visibleRegion.northeast.latitude,visibleRegion.northeast.longitude),
    //         LatLng(visibleRegion.southwest.latitude,visibleRegion.northeast.longitude),
    //         LatLng(visibleRegion.northeast.latitude,visibleRegion.southwest.longitude),
    //         // LatLng(21.2497222,72.6946928),
    //         // //LatLng(21.2435317,72.8701549),
    //         // LatLng(21.2702262,72.8951576),
    //         // // LatLng(21.2501985,72.8698966),
    //         // LatLng(21.2045978,72.9248321),
    //         // LatLng(21.1397199,72.8107377),
    //
    //       ],
    //       visible: true,
    //       geodesic: false,
    //
    //
    //       strokeWidth: 2,
    //       strokeColor: app_Orange_FF7448,
    //       fillColor: app_divider_E1EBF0.withOpacity(0.1)
    //   )
    // };
   // old one
    // mapController.animateCamera(
    //   CameraUpdate.newLatLng(
    //     LatLng(propertiesDetailModel!.lat, propertiesDetailModel!.long),
    //   ),
    // );

    if (isFormDrag) {
      // selectedMarkerIndex = index??0;
      selectedMarkerId = placeDetail!.id.toString();
    }

    update();
  }

  void _showMarkers(Set<Marker> newMarkers) {
    if (kDebugMode) {
      print('Updated ${newMarkers.length} markers');
    }
    markers = newMarkers;

   


    // polygon = {
    //   Polygon(
    //     polygonId: const PolygonId("1"),
    //
    //
    //
    //
    //     points: const [
    //       LatLng(21.2497222,72.6946928),
    //       //LatLng(21.2435317,72.8701549),
    //        LatLng(21.2702262,72.8951576),
    //       // LatLng(21.2501985,72.8698966),
    //       LatLng(21.2045978,72.9248321),
    //       LatLng(21.1397199,72.8107377),
    //
    //     ],
    //       visible: true,
    //       geodesic: false,
    //
    //
    //     strokeWidth: 10,
    //     strokeColor: app_Orange_FF7448,
    //     fillColor: app_divider_E1EBF0.withOpacity(0.1)
    //   )
    // };

    update();
  }

  // List<LatLng> boundriesLatLng = [
  //   LatLng(1.4123515,	49.4690371),
  //   LatLng(1.4119498,	49.4689868),
  //   LatLng(1.4114188,	49.4689141),
  //   LatLng(1.4110906,	49.4688431),
  //   LatLng(1.4108753,	49.4687343),
  //   LatLng(1.4107765,	49.4686013),
  //   LatLng(1.4108114,	49.4684742),
  //   LatLng(1.4109767,	49.4683528),
  //   LatLng(1.4118533,	49.4678886),
  //   LatLng(1.4122318,	49.4677878),
  //   LatLng(1.4125858,	49.4676015),
  //   LatLng(1.4129593,	49.467385),
  //   LatLng(1.4139391,	49.4666495),
  //   LatLng(1.4149708,	49.4658083),
  //   LatLng(1.4152954,	49.4654303),
  //   LatLng(1.4155153,	49.4650366),
  //   LatLng(1.4160861,	49.464241),
  //   LatLng(1.4163511,	49.4639159),
  //   LatLng(1.4168503,	49.4633676),
  //   LatLng(1.4171285,	49.4631416),
  //   LatLng(1.4174361,	49.4629576),
  //   LatLng(1.4178229,	49.4628025),
  //   LatLng(1.4176723,	49.4621625),
  //   LatLng(1.4168767,	49.4622837),
  //   LatLng(1.4167283,	49.4623338),
  //   LatLng(1.4158855,	49.4614426),
  //   LatLng(1.4162129,	49.4614653),
  //   LatLng(1.4175255,	49.4613756),
  //   LatLng(1.4190467,	49.4613075),
  //   LatLng(1.4188371,	49.4610934),
  //   LatLng(1.42011	,  49.4611838),
  //   LatLng(1.4205684,	49.4607876),
  //   LatLng(1.4212998,	49.4607863),
  //   LatLng(1.4223363,	49.4602453),
  //   LatLng(1.4234592,	49.4606404),
  //   LatLng(1.4246851,	49.4610806),
  //   LatLng(1.4288176,	49.4624694),
  //   LatLng(1.4290994,	49.4619665),
  //   LatLng(1.430148	,  49.4620348),
  //   LatLng(1.4302181,	49.4618418),
  //   LatLng(1.4299212,	49.4618361),
  //   LatLng(1.4303415,	49.4609724),
  //   LatLng(1.431337	,  49.4597651),
  //   LatLng(1.4306528,	49.4593656),
  //   LatLng(1.4317732,	49.4592107),
  //   LatLng(1.4325798,	49.4590668),
  //   LatLng(1.4327079,	49.4590611),
  //   LatLng(1.4333472,	49.4589627),
  //   LatLng(1.4333226,	49.4589124),
  //   LatLng(1.4347118,	49.4585473),
  //   LatLng(1.4348395,	49.458842),
  //   LatLng(1.4359403,	49.4586757),
  //   LatLng(1.4357493,	49.4582052),
  //   LatLng(1.4360631,	49.4581332),
  //   LatLng(1.4364109,	49.4581217),
  //   LatLng(1.4368065,	49.4580681),
  //   LatLng(1.436735	,  49.4580157),
  //   LatLng(1.436675	,  49.4579349),
  //   LatLng(1.4366428,	49.4572114),
  //   LatLng(1.4364542,	49.4559621),
  //   LatLng(1.4364503,	49.4557804),
  //   LatLng(1.4365616,	49.4553173),
  //   LatLng(1.4365219,	49.4550782),
  //   LatLng(1.4378005,	49.4547709),
  //   LatLng(1.4421346,	49.4529371),
  //   LatLng(1.4485708,	49.4501465),
  //   LatLng(1.4490345,	49.4501699),
  //   LatLng(1.45753	,  49.4506098),
  //   LatLng(1.4762088,	49.451455),
  //   LatLng(1.4760619,	49.4534031),
  //   LatLng(1.4759948,	49.454654),
  //   LatLng(1.4762507,	49.4551342),
  //   LatLng(1.4764598,	49.4553883),
  //   LatLng(1.4765846,	49.4555002),
  //   LatLng(1.4766873,	49.4556858),
  //   LatLng(1.4767132,	49.455863),
  //   LatLng(1.4766992,	49.4570762),
  //   LatLng(1.4766319,	49.4580245),
  //   LatLng(1.4763655,	49.458503),
  //   LatLng(1.4762742,	49.4587426),
  //   LatLng(1.4761849,	49.4588721),
  //   LatLng(1.4760809,	49.4589615),
  //   LatLng(1.476001	,  49.4591378),
  //   LatLng(1.475968	,  49.4592677),
  //   LatLng(1.4748772,	49.4604111),
  //   LatLng(1.4744716,	49.460823),
  //   LatLng(1.4742578,	49.4609608),
  //   LatLng(1.4733115,	49.4635172),
  //   LatLng(1.4733269,	49.4636545),
  //   LatLng(1.4723007,	49.4638685),
  //   LatLng(1.4716458,	49.4639432),
  //   LatLng(1.4710642,	49.4639587),
  //   LatLng(1.4692171,	49.463871),
  //   LatLng(1.4672787,	49.4639122),
  //   LatLng(1.4654903,	49.4639091),
  //   LatLng(1.4651754,	49.4639173),
  //   LatLng(1.4658975,	49.4662879),
  //   LatLng(1.4638289,	49.4663535),
  //   LatLng(1.4633287,	49.4663828),
  //   LatLng(1.4619501,	49.4665211),
  //   LatLng(1.4588408,	49.4669249),
  //   LatLng(1.4580585,	49.4670418),
  //   LatLng(1.4560612,	49.4673777),
  //   LatLng(1.453183	,  49.4678669),
  //   LatLng(1.4531337,	49.4679015),
  //   LatLng(1.4523395,	49.4689306),
  //   LatLng(1.4514182,	49.4683451),
  //   LatLng(1.4503697,	49.4687673),
  //   LatLng(1.4503069,	49.4687902),
  //   LatLng(1.4501696,	49.4688792),
  //   LatLng(1.4421382,	49.4693205),
  //   LatLng(1.4421001,	49.4694513),
  //   LatLng(1.4405787,	49.4693937),
  //   LatLng(1.4407029,	49.469882),
  //   LatLng(1.4397602,	49.470682),
  //   LatLng(1.4370442,	49.4729918),
  //   LatLng(1.4373227,	49.4723774),
  //   LatLng(1.4373619,	49.4721958),
  //   LatLng(1.437529	,  49.4712147),
  //   LatLng(1.4355853,	49.4708323),
  //   LatLng(1.4355902,	49.4711228),
  //   LatLng(1.4336877,	49.471028),
  //   LatLng(1.4313352,	49.4704385),
  //   LatLng(1.4310502,	49.4709696),
  //   LatLng(1.4300542,	49.470788),
  //   LatLng(1.429027	,  49.4706664),
  //   LatLng(1.4285771,	49.4706228),
  //   LatLng(1.4281773,	49.4705057),
  //   LatLng(1.4278938,	49.470461),
  //   LatLng(1.4275137,	49.4704327),
  //   LatLng(1.4258314,	49.4701322),
  //   LatLng(1.4250706,	49.4720335),
  //   LatLng(1.4223264,	49.4713592),
  //   LatLng(1.4201145,	49.4707281),
  //   LatLng(1.4200538,	49.4708261),
  //   LatLng(1.4197158,	49.4707971),
  //   LatLng(1.4183064,	49.4704846),
  //   LatLng(1.4177988,	49.4703224),
  //   LatLng(1.4168738,	49.4700847),
  //   LatLng(1.4163994,	49.4699851),
  //   LatLng(1.4158235,	49.469832),
  //   LatLng(1.4152169,	49.4696309),
  //   LatLng(1.4147818,	49.4694669),
  //   LatLng(1.4131334,	49.4691224),
  //   LatLng(1.4123515,	49.4690371),
  //
  // ];




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
                      Get.toNamed(Routes.propertyDetailScreen);
                    }else{
                      Get.toNamed(Routes.loginScreen);
                    }


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


