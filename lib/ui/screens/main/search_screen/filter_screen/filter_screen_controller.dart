import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/models/cluster_item.dart';
import 'package:house_jet_properties/models/home_type_model.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/theme/app_strings.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import 'package:house_jet_properties/ui/widgets/app_price_slider.dart';


class FilterScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    configTabBar();
    // TODO: implement onInit
    super.onInit();
  }

  double priceStartValue = 18;
  double priceEndValue = 300;
  double schoolRatingValueStart = 18;
  double schoolRatingEndValue = 100;
  double walkScoreValueStart = 18;
  double walkScoreValueEndValue = 100;
  RxInt currentIndex = 0.obs;
  late TabController tabController;

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

  bool isSquareFit = false;
  bool isLotSize = false;
  bool isStatus = false;
  bool isPropertyDetails = false;
  bool isStories = false;
  bool isYearBuilt = false;
  bool isHomeFeature = false;
  bool isGarageSpots = false;
  bool isHqaFees = false;
  bool isPropertyText = false;
  bool isCostYearBuilt = false;
  bool isListingType = false;
  bool isSchoolType = false;
  bool isWalkScore = false;
  bool isOpenHouse = false;
  bool isKeyWordSearch = false;
  bool isSoldWithinScreen = false;
  bool isPets = false;
  bool isAmenities = false;

  HomeTypeModel homeFeatureRadio = HomeTypeModel();
  HomeTypeModel listingTypeRadio = HomeTypeModel();
  TextEditingController commuteController = TextEditingController();
  TextEditingController keyWordSearchController = TextEditingController();

  late IndicatorRangeSliderThumbShape<int> indicatorRangeSliderThumbShape =
      IndicatorRangeSliderThumbShape(
          priceStartValue.toInt(), priceEndValue.toInt());
  late IndicatorRangeSliderThumbShape<int> schoolRatingSliderThumbShape =
      IndicatorRangeSliderThumbShape(
          schoolRatingValueStart.toInt(), schoolRatingValueStart.toInt());
  late IndicatorRangeSliderThumbShape<int> walkScoreSliderThumbShape =
      IndicatorRangeSliderThumbShape(
          walkScoreValueStart.toInt(), walkScoreValueEndValue.toInt());

  List<HomeTypeModel> homeTypeList = [
    HomeTypeModel(
      icon: homeIcon,
      subTitleText: houseText,
      isSeleacted: true,
    ),
    HomeTypeModel(
      icon: townHouseIcon,
      subTitleText: townHouseText,
      isSeleacted: false,
    ),
    HomeTypeModel(
      icon: condoIcon,
      subTitleText: condoText,
      isSeleacted: false,
    ),
    HomeTypeModel(
      icon: multifamilyIcon,
      subTitleText: multifamily,
      isSeleacted: false,
    ),
    HomeTypeModel(
      icon: multifamily2Icon,
      subTitleText: multifamily,
      isSeleacted: false,
    ),
    HomeTypeModel(
      icon: coOpIcon,
      subTitleText: coOpText,
      isSeleacted: false,
    ),
    HomeTypeModel(
      icon: multifamily3Icon,
      subTitleText: multifamily,
      isSeleacted: false,
    ),
    HomeTypeModel(
      icon: otherIcon,
      subTitleText: otherText,
      isSeleacted: false,
    ),
  ];

  onHomeCardTypeTap(int i) {
    for (var val in homeTypeList) {
      val.isSeleacted = false;
    }
    homeTypeList[i].isSeleacted = !homeTypeList[i].isSeleacted;
    update();
  }

  List<HomeTypeModel> bedroomList = [
    HomeTypeModel(
      subTitleText: "Any",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "01",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "02",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "03",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "4+",
      isSeleacted: false,
    ),
  ];

  onBedroomCardTypeTap(int i) {
    for (var val in bedroomList) {
      val.isSeleacted = false;
    }
    bedroomList[i].isSeleacted = !bedroomList[i].isSeleacted;
    update();
  }

  List<HomeTypeModel> bathroomList = [
    HomeTypeModel(
      subTitleText: "Any",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "01",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "02",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "03",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "4+",
      isSeleacted: false,
    ),
  ];

  onBathroomCardTypeTap(int i) {
    for (var val in bathroomList) {
      val.isSeleacted = false;
    }
    bathroomList[i].isSeleacted = !bathroomList[i].isSeleacted;
    update();
  }

  List<HomeTypeModel> deriveTimeList = [
    HomeTypeModel(
      subTitleText: "10 min",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "20 min",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "30 min",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "40 min",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "50 min",
      isSeleacted: false,
    ),
  ];

  onDriveTimeCardTypeTap(int i) {
    for (var val in deriveTimeList) {
      val.isSeleacted = false;
    }
    deriveTimeList[i].isSeleacted = !deriveTimeList[i].isSeleacted;
    update();
  }

  onIndicatorRangeChange(double start, double end) {
    indicatorRangeSliderThumbShape.start = start.toInt();
    indicatorRangeSliderThumbShape.end = end.toInt();
    update();
  }

  onPriceRangeChange(double start, double end) {
    priceStartValue = start;
    priceEndValue = end;
    update();
  }

  onSchoolRatingChange(double start) {
    schoolRatingValueStart = start;
    // schoolRatingEndValue = end;
    update();
  }

  onSchoolIndicatorRangeChange(double start, double end) {
    schoolRatingSliderThumbShape.start = start.toInt();
    schoolRatingSliderThumbShape.end = end.toInt();
    update();
  }

  onWalkRatingChange(double start,  ) {
    walkScoreValueStart = start;
    // walkScoreValueEndValue = end;
    update();
  }

  onWalkIndicatorRangeChange(double start, double end) {
    walkScoreSliderThumbShape.start = start.toInt();
    walkScoreSliderThumbShape.end = end.toInt();
    update();
  }

  List<HomeTypeModel> squareFeetNoMinList = [
    HomeTypeModel(
      subTitleText: "No Min",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "1250",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "1500",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "2000",
      isSeleacted: false,
    ),
  ];

  List<HomeTypeModel> squareFeetNoMaxList = [
    HomeTypeModel(
      subTitleText: "No Max",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "1250",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "1500",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "2000",
      isSeleacted: false,
    ),
  ];

  List<HomeTypeModel> lotSizeNoMinList = [
    HomeTypeModel(
      subTitleText: "No Min",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "1250",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "1500",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "2000",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> lotNoMaxList = [
    HomeTypeModel(
      subTitleText: "No Max",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "1250",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "1500",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "2000",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> statusList = [
    HomeTypeModel(
      subTitleText: "Coming Soon",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Active",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Under Contract/Pending",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> storiesDayList = [
    HomeTypeModel(
      subTitleText: "01",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "02",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "03",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "04",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "05",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "06",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> storiesMonthList = [
    HomeTypeModel(
      subTitleText: "01",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "02",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "03",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "04",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "05",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "06",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> yearBuiltList = [
    HomeTypeModel(
      subTitleText: "2021",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "2022",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "2023",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "04",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "2024",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> yearBuiltList1 = [
    HomeTypeModel(
      subTitleText: "2021",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "2022",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "2023",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "04",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "2024",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> propertyDetailList = [
    HomeTypeModel(
      subTitleText: "Fixer-upper",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Exclude 55+ Communities",
      isSeleacted: false,
    ),
  ];

  List<HomeTypeModel> homeFeatureList = [
    HomeTypeModel(
      subTitleText: "Pool",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Any",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Private Pool",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Community Pool",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Private or Community Pool",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "No Private Pool",
      isSeleacted: true,
    ),
  ];
  List<HomeTypeModel> garageSpotList = [
    HomeTypeModel(
      subTitleText: "Any",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "01",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "03",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "03",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "4+",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> garageSpotSelectList = [
    HomeTypeModel(
      subTitleText: "Include Outdoor Parking",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "RV Parking",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Air Conditioning",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Fireplace",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Primary Bedroom On Main Floor",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Waterfront",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Basement",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Has View",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Pet Allowed",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Washer/Dryer Hookup",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Guest House",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Elevator",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Accessible Home",
      isSeleacted: false,
    ),
  ];

  onGarageCardTypeTap(int i) {
    for (var val in garageSpotList) {
      val.isSeleacted = false;
    }
    garageSpotList[i].isSeleacted = !garageSpotList[i].isSeleacted;
    update();
  }

  List<HomeTypeModel> hqaFeesList = [
    HomeTypeModel(
      subTitleText: "\$400/Month",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "\$500/Month",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "\$600/Month",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "\$700/Month",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> propertyTexList = [
    HomeTypeModel(
      subTitleText: "\$1000/Month",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "\$1200/Month",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "\$1500/Month",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "\$1700/Month",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> yearBuiltCostFinnanceList = [
    HomeTypeModel(
      subTitleText: "\$100 ",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "\$150",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "\$200",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> yearBuiltCostFinnanceList2 = [
    HomeTypeModel(
      subTitleText: "\$100 ",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "\$150",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "\$200",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> acceptedFinancingList = [
    HomeTypeModel(
      subTitleText: "Exclude Land Leases",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Price Reduced",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> listingTypeList = [
    HomeTypeModel(
      subTitleText: "Agent listed",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "No Agent listed",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "By Owner",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> openHouseTourList = [
    HomeTypeModel(
      subTitleText: "Open House",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Self Tour",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "3D & Video Tour",
      isSeleacted: false,
    ),
  ];

  ///    For Sold Screeen                          / / / / /
  List<HomeTypeModel> soldWithinList = [
    HomeTypeModel(
      subTitleText: "Last 1 Month",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Last 3 Months",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Last 6 Months",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Last 1 Year",
      isSeleacted: false,
    ),
  ];

  List<HomeTypeModel> amenitiesList = [
    HomeTypeModel(
      subTitleText: "Air Conditioning",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "In-Unit Washer & Dryer",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Laundry Facility",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Washer/Dryer Hookups",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Dishwasher",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Parking Allowed",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Utilities Included",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Furnished",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Pool",
      isSeleacted: false,
    ),
    HomeTypeModel(
      subTitleText: "Short Term",
      isSeleacted: false,
    ),
  ];
  List<HomeTypeModel> petsList = [
    HomeTypeModel(
      subTitleText: "Dogs Allowed",
      isSeleacted: true,
    ),
    HomeTypeModel(
      subTitleText: "Cats Allowed",
      isSeleacted: false,
    ),
  ];
}
