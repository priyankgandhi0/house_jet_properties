import 'dart:convert';

import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';




GetAllPropertiesModel propertiesModelFromJson(String str) => GetAllPropertiesModel.fromJson(json.decode(str));

String propertiesModelToJson(GetAllPropertiesModel data) => json.encode(data.toJson());

class GetAllPropertiesModel {
  bool? success;
  List<PropertiesModel>? properties;

  GetAllPropertiesModel({
    this.success,
    this.properties,
  });

  factory GetAllPropertiesModel.fromJson(Map<String, dynamic> json) => GetAllPropertiesModel(
    success: json["success"],
    properties: json["properties"] == null ? [] : List<PropertiesModel>.from(json["properties"]!.map((x) => PropertiesModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "properties": properties == null ? [] : List<dynamic>.from(properties!.map((x) => x.toJson())),
  };
}

class PropertiesModel with ClusterItem{
  int? id;
  double? latitude;
  double? longitude;
  int? listPrice;
  String? listingId;
  int? photoCount;
  int? retsFeedId;
  int? baths;
  int? sqFtTotal;
  int? beds;
  String? city;
  String? county;
  String? stateOrProvince;
  String? streetName;
  String? streetDirection;
  String? streetNumber;
  int? streetNumberInt;
  String? postalCode;
  String? propertyType;
  String? alias;
  String? sysid;
  Office? office;
  Agent? agent;
  List<PropertyPhoto>? propertyPhotos;
  String? imageBasePath;
  String? fullAddress;
  String? link;
  List<String>? photos;
  String? streetAddress;
  String? cityStateZip;
  String? houseJetUrl;
  String? shortPrice;
  String? longState;



  PropertiesModel({
    this.id,
    this.latitude,
    this.longitude,
    this.listPrice,
    this.listingId,
    this.photoCount,
    this.retsFeedId,
    this.baths,
    this.sqFtTotal,
    this.beds,
    this.city,
    this.county,
    this.stateOrProvince,
    this.streetName,
    this.streetDirection,
    this.streetNumber,
    this.streetNumberInt,
    this.postalCode,
    this.propertyType,
    this.alias,
    this.sysid,
    this.office,
    this.agent,
    this.propertyPhotos,
    this.imageBasePath,
    this.fullAddress,
    this.link,
    this.photos,
    this.streetAddress,
    this.cityStateZip,
    this.houseJetUrl,
    this.shortPrice,
    this.longState,
  });

  factory PropertiesModel.fromJson(Map<String, dynamic> json) => PropertiesModel(
    id: json["id"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    listPrice: json["ListPrice"],
    listingId: json["ListingID"],
    photoCount: json["PhotoCount"],
    retsFeedId: json["retsFeed_id"],
    baths: json["Baths"],
    sqFtTotal: json["SqFtTotal"],
    beds: json["Beds"],
    city: json["City"],
    county: json["County"],
    stateOrProvince: json["StateOrProvince"],
    streetName: json["StreetName"],
    streetDirection: json["StreetDirection"],
    streetNumber: json["StreetNumber"],
    streetNumberInt: json["StreetNumberInt"],
    postalCode: json["PostalCode"],
    propertyType: json["PropertyType"],
    alias: json["alias"],
    sysid: json["sysid"],
    office: json["office"] == null ? null : Office.fromJson(json["office"]),
    agent: json["agent"] == null ? null : Agent.fromJson(json["agent"]),
    propertyPhotos: json["property_photos"] == null ? [] : List<PropertyPhoto>.from(json["property_photos"]!.map((x) => PropertyPhoto.fromJson(x))),
    imageBasePath: json["image_base_path"],
    fullAddress: json["full_address"],
    link: json["link"],
    photos: json["photos"] == null ? [] : List<String>.from(json["photos"]!.map((x) => x)),
    streetAddress: json["street_address"],
    cityStateZip: json["city_state_zip"],
    houseJetUrl: json["house_jet_url"],
    shortPrice: json["short_price"],
    longState: json["long_state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "latitude": latitude,
    "longitude": longitude,
    "ListPrice": listPrice,
    "ListingID": listingId,
    "PhotoCount": photoCount,
    "retsFeed_id": retsFeedId,
    "Baths": baths,
    "SqFtTotal": sqFtTotal,
    "Beds": beds,
    "City": city,
    "County": county,
    "StateOrProvince": stateOrProvince,
    "StreetName": streetName,
    "StreetDirection": streetDirection,
    "StreetNumber": streetNumber,
    "StreetNumberInt": streetNumberInt,
    "PostalCode": postalCode,
    "PropertyType": propertyType,
    "alias": alias,
    "sysid": sysid,
    "office": office?.toJson(),
    "agent": agent?.toJson(),
    "property_photos": propertyPhotos == null ? [] : List<dynamic>.from(propertyPhotos!.map((x) => x.toJson())),
    "image_base_path": imageBasePath,
    "full_address": fullAddress,
    "link": link,
    "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x)),
    "street_address": streetAddress,
    "city_state_zip": cityStateZip,
    "house_jet_url": houseJetUrl,
    "short_price": shortPrice,
    "long_state": longState,

  };

  @override
  // TODO: implement location
  LatLng get location =>  LatLng(latitude!, longitude!);

}


class Agent {
  String? agentId;
  String? firstName;
  String? lastName;
  String? agentStateLicense;
  String? fullName;

  Agent({
    this.agentId,
    this.firstName,
    this.lastName,
    this.agentStateLicense,
    this.fullName,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
    agentId: json["AgentID"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    agentStateLicense: json["AgentStateLicense"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "AgentID": agentId,
    "FirstName": firstName,
    "LastName": lastName,
    "AgentStateLicense": agentStateLicense,
    "full_name": fullName,
  };
}

class Office {
  String? firmId;
  String? name;

  Office({
    this.firmId,
    this.name,
  });

  factory Office.fromJson(Map<String, dynamic> json) => Office(
    firmId: json["FirmID"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "FirmID": firmId,
    "Name": name,
  };
}

class PropertyPhoto {
  int? id;
  int? retsFeedId;
  String? listingId;
  int? photoNum;
  String? sourceUrl;
  String? thumbnailUrl;
  String? smallUrl;
  String? mediumUrl;
  String? bigUrl;
  int? processed;
  dynamic error;
  DateTime? array;
  DateTime? updatedAt;

  PropertyPhoto({
    this.id,
    this.retsFeedId,
    this.listingId,
    this.photoNum,
    this.sourceUrl,
    this.thumbnailUrl,
    this.smallUrl,
    this.mediumUrl,
    this.bigUrl,
    this.processed,
    this.error,
    this.array,
    this.updatedAt,
  });

  factory PropertyPhoto.fromJson(Map<String, dynamic> json) => PropertyPhoto(
    id: json["id"],
    retsFeedId: json["rets_feed_id"],
    listingId: json["listing_id"],
    photoNum: json["photo_num"],
    sourceUrl: json["source_url"],
    thumbnailUrl: json["thumbnail_url"],
    smallUrl: json["small_url"],
    mediumUrl: json["medium_url"],
    bigUrl: json["big_url"],
    processed: json["processed"],
    error: json["error"],
    array: json["Array"] == null ? null : DateTime.parse(json["Array"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rets_feed_id": retsFeedId,
    "listing_id": listingId,
    "photo_num": photoNum,
    "source_url": sourceUrl,
    "thumbnail_url": thumbnailUrl,
    "small_url": smallUrl,
    "medium_url": mediumUrl,
    "big_url": bigUrl,
    "processed": processed,
    "error": error,
    "Array": array?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
