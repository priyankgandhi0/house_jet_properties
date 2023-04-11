import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place with ClusterItem {
  final String name;
  final String address;
  final double lat;
  final double lang;

  Place({
    required this.name,
    required this.address,
    required this.lat,
    required this.lang,
  });

  // @override
  // String toString() {
  //   return 'Place $name (closed : $isLiked)';
  // }

  @override
  LatLng get location => LatLng(lat, lang);
}

class PropertyData {
  final String name;
  final String address;
  final double lat;
  final double lang;

  PropertyData({
    required this.name,
    required this.address,
    required this.lat,
    required this.lang,
  });

  factory PropertyData.fromJson(Map<String, dynamic> json) => PropertyData(
        name: json["name"],
        address: json["address"],
        lat: json["lat"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "lat": lat,
        "lang": lang,
      };
}

String houseText = "House";
String apartmentText = "Apartment";

List<PropertyData> propertyDetailes = [
  for (int i = 1; i <= 10; i++)
    PropertyData(
        name: "${(i % 2 == 0) ? houseText : apartmentText} $i",
        address: "Shivshakti society, Katargam, Surat ",
        lat: 21.2266 + i * 0.001,
        lang: 72.8312 - i * 0.001),

  for (int i = 11; i <= 20; i++)
    PropertyData(
        name: "${(i % 2 == 0) ? houseText : apartmentText} $i",
        address: "Shivshakti society, Adajan, Surat ",
        lat: 21.197112 + i * 0.001,
        lang: 72.790440 - i * 0.001),

  for (int i = 11; i <= 20; i++)
    PropertyData(
        name: "${(i % 2 == 0) ? houseText : apartmentText} $i",
        address: "Shivshakti society, Katargam, Surat",
        lat: 21.100719 + i * 0.001,
        lang: 72.743169 - i * 0.001),

  ///USA
  for (int i = 21; i <= 30; i++)
    PropertyData(
        name: "${(i % 2 == 0) ? houseText : apartmentText} $i",
        address: "Weld County, Colorado, USA",
        lat: 36.179478 + i * 0.001,
        lang: -86.747108 - i * 0.001),

  ///Canada
  for (int i = 31; i <= 40; i++)
    PropertyData(
        name: "${(i % 2 == 0) ? houseText : apartmentText} $i",
        address:
            "7th Toronto Regiment Royal Canadian Artillery, Toronto, Canada",
        lat: 43.677842 + i * 0.001,
        lang: -79.378451 - i * 0.001),

  ///Pakistan
  for (int i = 41; i <= 50; i++)
    PropertyData(
        name: "${(i % 2 == 0) ? houseText : apartmentText} $i",
        address: "BLOCK 9, Block 9, Dera Ghazi Khan, Punjab, Pakistan",
        lat: 30.053373 + i * 0.001,
        lang: 70.637231 - i * 0.001),
];

class Properties {
  Properties({
    required this.data,
  });

  List<PropertyData> data;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        data: List<PropertyData>.from(
            json["data"].map((x) => PropertyData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
