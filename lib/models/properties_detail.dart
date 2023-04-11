import 'dart:convert';

import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

PropertiesDetailModel propertiesDetailFromJson(String str) =>
    PropertiesDetailModel.fromJson(json.decode(str));

String propertiesDetailToJson(PropertiesDetailModel data) =>
    json.encode(data.toJson());

class PropertiesDetailModel with ClusterItem {
  PropertiesDetailModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.isForSale,
    required this.description,
    required this.bedSize,
    required this.bathRoomSize,
    required this.squareFt,
    required this.lat,
    required this.long,
    required this.address,
  });

  int id;
  String name;
  int price;
  String image;
  int isForSale;
  String description;
  int bedSize;
  int bathRoomSize;
  int squareFt;
  double lat;
  double long;
  String address;

  factory PropertiesDetailModel.fromJson(Map<String, dynamic> json) =>
      PropertiesDetailModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        isForSale: json["is_for_sale"],
        description: json["description"],
        bedSize: json["bed_size"],
        bathRoomSize: json["bath_room_size"],
        squareFt: json["square_ft"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "is_for_sale": isForSale,
        "description": description,
        "bed_size": bedSize,
        "bath_room_size": bathRoomSize,
        "square_ft": squareFt,
        "lat": lat,
        "long": long,
        "address": address,
      };

  @override
  LatLng get location => LatLng(lat, long);
}
