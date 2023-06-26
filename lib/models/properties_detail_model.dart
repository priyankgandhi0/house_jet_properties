// To parse this JSON data, do
//
//     final propertiesByAlias = propertiesByAliasFromJson(jsonString);

import 'dart:convert';

PropertiesByAliasDetail propertiesByAliasFromJson(String str) => PropertiesByAliasDetail.fromJson(json.decode(str));

String propertiesByAliasToJson(PropertiesByAliasDetail data) => json.encode(data.toJson());

class PropertiesByAliasDetail {
  bool? success;
  PropertyByAlias? property;

  PropertiesByAliasDetail({
    this.success,
    this.property,
  });

  factory PropertiesByAliasDetail.fromJson(Map<String, dynamic> json) => PropertiesByAliasDetail(
    success: json["success"],
    property: json["property"] == null ? null : PropertyByAlias.fromJson(json["property"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "property": property?.toJson(),
  };
}

class PropertyByAlias {
  int? id;
  int? propertyTypeId;
  String? area;
  String? city;
  String? county;
  dynamic subdivision;
  String? stateOrProvince;
  String? streetName;
  String? streetDirection;
  String? streetNumber;
  int? streetNumberInt;
  String? postalCode;
  DateTime? datePhoto;
  DateTime? modificationTimestamp;
  String? foreclosureYn;
  String? listingAgentId;
  String? listingFirmId;
  String? coListingAgentId;
  String? coListingFirmId;
  int? listPrice;
  dynamic listPriceMax;
  dynamic listPriceMin;
  String? listingId;
  String? featured;
  int? featuredPosition;
  int? photoCount;
  String? propertyLocation;
  String? propertyType;
  String? subType;
  String? publicRemarks;
  String? sewerType;
  int? sqFtTotal;
  String? virtualTourUrl;
  int? yearBuiltInt;
  String? streetConstruction;
  dynamic imgLastUpdatedDate;
  dynamic imgLastAttemptDate;
  String? auctionStatus;
  int? minBidPrice;
  dynamic bidDate;
  int? userBidPrice;
  dynamic userBidDate;
  int? userId;
  int? beds;
  int? baths;
  int? bathsHalf;
  int? bathsThreeQuarter;
  String? parking;
  String? design;
  String? newConstruction;
  String? masterBedroomFloor;
  String? fuel;
  String? insideCity;
  String? waterSewer;
  String? exteriorConstruction;
  String? createdById;
  String? modifiedById;
  double? longitude;
  double? latitude;
  String? flgLatest;
  String? basement;
  String? garageCapacity;
  String? schoolDistrict;
  String? lotSize;
  String? garageType;
  String? sysid;
  String? publicAccess;
  String? addressHidden;
  dynamic deleted;
  String? transactionType;
  String? communityType;
  int? taxAmountSummer;
  int? taxAmountWinter;
  String? waterfront;
  String? vegetation;
  String? sellerOptions;
  String? exteriorFeatures;
  String? interiorFeatures;
  String? view;
  String? furnished;
  String? waterview;
  String? pool;
  String? dockType;
  String? histDistYn;
  String? blocksToOcean;
  String? fireplace;
  String? rooms;
  String? specialConditions;
  String? propertyFeatures;
  String? landSize;
  int? retsFeedId;
  int? sendToFriendCount;
  String? hasOtherFeedVersion;
  dynamic listingAdded;
  DateTime? created;
  String? alias;
  int? mileMarker;
  String? mileMarkerArea;
  String? listingArea;
  String? other1;
  String? other2;
  String? other3;
  String? other4;
  String? other5;
  String? other6;
  String? other7;
  String? other8;
  String? other9;
  String? other10;
  String? status;
  String? coordSource;
  bool? offline;
  dynamic offlinePhotos;
  String? featuredImage;
  dynamic adminId;
  RetsFeed? retsFeed;
  List<PropertyPhoto>? propertyPhotos;
  Office? office;
  Agent? agent;
  String? imageBasePath;
  String? fullAddress;
  String? link;
  List<String>? photos;
  String? streetAddress;
  String? cityStateZip;
  String? houseJetUrl;
  String? shortPrice;
  String? longState;

  PropertyByAlias({
    this.id,
    this.propertyTypeId,
    this.area,
    this.city,
    this.county,
    this.subdivision,
    this.stateOrProvince,
    this.streetName,
    this.streetDirection,
    this.streetNumber,
    this.streetNumberInt,
    this.postalCode,
    this.datePhoto,
    this.modificationTimestamp,
    this.foreclosureYn,
    this.listingAgentId,
    this.listingFirmId,
    this.coListingAgentId,
    this.coListingFirmId,
    this.listPrice,
    this.listPriceMax,
    this.listPriceMin,
    this.listingId,
    this.featured,
    this.featuredPosition,
    this.photoCount,
    this.propertyLocation,
    this.propertyType,
    this.subType,
    this.publicRemarks,
    this.sewerType,
    this.sqFtTotal,
    this.virtualTourUrl,
    this.yearBuiltInt,
    this.streetConstruction,
    this.imgLastUpdatedDate,
    this.imgLastAttemptDate,
    this.auctionStatus,
    this.minBidPrice,
    this.bidDate,
    this.userBidPrice,
    this.userBidDate,
    this.userId,
    this.beds,
    this.baths,
    this.bathsHalf,
    this.bathsThreeQuarter,
    this.parking,
    this.design,
    this.newConstruction,
    this.masterBedroomFloor,
    this.fuel,
    this.insideCity,
    this.waterSewer,
    this.exteriorConstruction,
    this.createdById,
    this.modifiedById,
    this.longitude,
    this.latitude,
    this.flgLatest,
    this.basement,
    this.garageCapacity,
    this.schoolDistrict,
    this.lotSize,
    this.garageType,
    this.sysid,
    this.publicAccess,
    this.addressHidden,
    this.deleted,
    this.transactionType,
    this.communityType,
    this.taxAmountSummer,
    this.taxAmountWinter,
    this.waterfront,
    this.vegetation,
    this.sellerOptions,
    this.exteriorFeatures,
    this.interiorFeatures,
    this.view,
    this.furnished,
    this.waterview,
    this.pool,
    this.dockType,
    this.histDistYn,
    this.blocksToOcean,
    this.fireplace,
    this.rooms,
    this.specialConditions,
    this.propertyFeatures,
    this.landSize,
    this.retsFeedId,
    this.sendToFriendCount,
    this.hasOtherFeedVersion,
    this.listingAdded,
    this.created,
    this.alias,
    this.mileMarker,
    this.mileMarkerArea,
    this.listingArea,
    this.other1,
    this.other2,
    this.other3,
    this.other4,
    this.other5,
    this.other6,
    this.other7,
    this.other8,
    this.other9,
    this.other10,
    this.status,
    this.coordSource,
    this.offline,
    this.offlinePhotos,
    this.featuredImage,
    this.adminId,
    this.retsFeed,
    this.propertyPhotos,
    this.office,
    this.agent,
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

  factory PropertyByAlias.fromJson(Map<String, dynamic> json) => PropertyByAlias(
    id: json["id"],
    propertyTypeId: json["property_type_id"],
    area: json["Area"],
    city: json["City"],
    county: json["County"],
    subdivision: json["Subdivision"],
    stateOrProvince: json["StateOrProvince"],
    streetName: json["StreetName"],
    streetDirection: json["StreetDirection"],
    streetNumber: json["StreetNumber"],
    streetNumberInt: json["StreetNumberInt"],
    postalCode: json["PostalCode"],
    datePhoto: json["DatePhoto"] == null ? null : DateTime.parse(json["DatePhoto"]),
    modificationTimestamp: json["ModificationTimestamp"] == null ? null : DateTime.parse(json["ModificationTimestamp"]),
    foreclosureYn: json["ForeclosureYN"],
    listingAgentId: json["ListingAgentID"],
    listingFirmId: json["ListingFirmID"],
    coListingAgentId: json["CoListingAgentID"],
    coListingFirmId: json["CoListingFirmID"],
    listPrice: json["ListPrice"],
    listPriceMax: json["ListPriceMax"],
    listPriceMin: json["ListPriceMin"],
    listingId: json["ListingID"],
    featured: json["Featured"],
    featuredPosition: json["FeaturedPosition"],
    photoCount: json["PhotoCount"],
    propertyLocation: json["PropertyLocation"],
    propertyType: json["PropertyType"],
    subType: json["SubType"],
    publicRemarks: json["PublicRemarks"],
    sewerType: json["SewerType"],
    sqFtTotal: json["SqFtTotal"],
    virtualTourUrl: json["VirtualTourURL"],
    yearBuiltInt: json["YearBuiltInt"],
    streetConstruction: json["StreetConstruction"],
    imgLastUpdatedDate: json["ImgLastUpdatedDate"],
    imgLastAttemptDate: json["ImgLastAttemptDate"],
    auctionStatus: json["AuctionStatus"],
    minBidPrice: json["MinBidPrice"],
    bidDate: json["BidDate"],
    userBidPrice: json["UserBidPrice"],
    userBidDate: json["UserBidDate"],
    userId: json["UserId"],
    beds: json["Beds"],
    baths: json["Baths"],
    bathsHalf: json["BathsHalf"],
    bathsThreeQuarter: json["BathsThreeQuarter"],
    parking: json["Parking"],
    design: json["Design"],
    newConstruction: json["NewConstruction"],
    masterBedroomFloor: json["MasterBedroomFloor"],
    fuel: json["Fuel"],
    insideCity: json["InsideCity"],
    waterSewer: json["WaterSewer"],
    exteriorConstruction: json["ExteriorConstruction"],
    createdById: json["created_by_id"],
    modifiedById: json["modified_by_id"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    flgLatest: json["flg_latest"],
    basement: json["Basement"],
    garageCapacity: json["GarageCapacity"],
    schoolDistrict: json["SchoolDistrict"],
    lotSize: json["LotSize"],
    garageType: json["GarageType"],
    sysid: json["sysid"],
    publicAccess: json["publicAccess"],
    addressHidden: json["AddressHidden"],
    deleted: json["deleted"],
    transactionType: json["TransactionType"],
    communityType: json["CommunityType"],
    taxAmountSummer: json["TaxAmountSummer"],
    taxAmountWinter: json["TaxAmountWinter"],
    waterfront: json["Waterfront"],
    vegetation: json["Vegetation"],
    sellerOptions: json["SellerOptions"],
    exteriorFeatures: json["ExteriorFeatures"],
    interiorFeatures: json["InteriorFeatures"],
    view: json["View"],
    furnished: json["Furnished"],
    waterview: json["Waterview"],
    pool: json["Pool"],
    dockType: json["DockType"],
    histDistYn: json["HistDistYN"],
    blocksToOcean: json["BlocksToOcean"],
    fireplace: json["Fireplace"],
    rooms: json["Rooms"],
    specialConditions: json["SpecialConditions"],
    propertyFeatures: json["PropertyFeatures"],
    landSize: json["LandSize"],
    retsFeedId: json["retsFeed_id"],
    sendToFriendCount: json["send_to_friend_count"],
    hasOtherFeedVersion: json["has_other_feed_version"],
    listingAdded: json["ListingAdded"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    alias: json["alias"],
    mileMarker: json["MileMarker"],
    mileMarkerArea: json["MileMarkerArea"],
    listingArea: json["ListingArea"],
    other1: json["other_1"],
    other2: json["other_2"],
    other3: json["other_3"],
    other4: json["other_4"],
    other5: json["other_5"],
    other6: json["other_6"],
    other7: json["other_7"],
    other8: json["other_8"],
    other9: json["other_9"],
    other10: json["other_10"],
    status: json["status"],
    coordSource: json["coord_source"],
    offline: json["offline"],
    offlinePhotos: json["offline_photos"],
    featuredImage: json["featured_image"],
    adminId: json["admin_id"],
    retsFeed: json["rets_feed"] == null ? null : RetsFeed.fromJson(json["rets_feed"]),
    propertyPhotos: json["property_photos"] == null ? [] : List<PropertyPhoto>.from(json["property_photos"]!.map((x) => PropertyPhoto.fromJson(x))),
    office: json["office"] == null ? null : Office.fromJson(json["office"]),
    agent: json["agent"] == null ? null : Agent.fromJson(json["agent"]),
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
    "property_type_id": propertyTypeId,
    "Area": area,
    "City": city,
    "County": county,
    "Subdivision": subdivision,
    "StateOrProvince": stateOrProvince,
    "StreetName": streetName,
    "StreetDirection": streetDirection,
    "StreetNumber": streetNumber,
    "StreetNumberInt": streetNumberInt,
    "PostalCode": postalCode,
    "DatePhoto": datePhoto?.toIso8601String(),
    "ModificationTimestamp": modificationTimestamp?.toIso8601String(),
    "ForeclosureYN": foreclosureYn,
    "ListingAgentID": listingAgentId,
    "ListingFirmID": listingFirmId,
    "CoListingAgentID": coListingAgentId,
    "CoListingFirmID": coListingFirmId,
    "ListPrice": listPrice,
    "ListPriceMax": listPriceMax,
    "ListPriceMin": listPriceMin,
    "ListingID": listingId,
    "Featured": featured,
    "FeaturedPosition": featuredPosition,
    "PhotoCount": photoCount,
    "PropertyLocation": propertyLocation,
    "PropertyType": propertyType,
    "SubType": subType,
    "PublicRemarks": publicRemarks,
    "SewerType": sewerType,
    "SqFtTotal": sqFtTotal,
    "VirtualTourURL": virtualTourUrl,
    "YearBuiltInt": yearBuiltInt,
    "StreetConstruction": streetConstruction,
    "ImgLastUpdatedDate": imgLastUpdatedDate,
    "ImgLastAttemptDate": imgLastAttemptDate,
    "AuctionStatus": auctionStatus,
    "MinBidPrice": minBidPrice,
    "BidDate": bidDate,
    "UserBidPrice": userBidPrice,
    "UserBidDate": userBidDate,
    "UserId": userId,
    "Beds": beds,
    "Baths": baths,
    "BathsHalf": bathsHalf,
    "BathsThreeQuarter": bathsThreeQuarter,
    "Parking": parking,
    "Design": design,
    "NewConstruction": newConstruction,
    "MasterBedroomFloor": masterBedroomFloor,
    "Fuel": fuel,
    "InsideCity": insideCity,
    "WaterSewer": waterSewer,
    "ExteriorConstruction": exteriorConstruction,
    "created_by_id": createdById,
    "modified_by_id": modifiedById,
    "longitude": longitude,
    "latitude": latitude,
    "flg_latest": flgLatest,
    "Basement": basement,
    "GarageCapacity": garageCapacity,
    "SchoolDistrict": schoolDistrict,
    "LotSize": lotSize,
    "GarageType": garageType,
    "sysid": sysid,
    "publicAccess": publicAccess,
    "AddressHidden": addressHidden,
    "deleted": deleted,
    "TransactionType": transactionType,
    "CommunityType": communityType,
    "TaxAmountSummer": taxAmountSummer,
    "TaxAmountWinter": taxAmountWinter,
    "Waterfront": waterfront,
    "Vegetation": vegetation,
    "SellerOptions": sellerOptions,
    "ExteriorFeatures": exteriorFeatures,
    "InteriorFeatures": interiorFeatures,
    "View": view,
    "Furnished": furnished,
    "Waterview": waterview,
    "Pool": pool,
    "DockType": dockType,
    "HistDistYN": histDistYn,
    "BlocksToOcean": blocksToOcean,
    "Fireplace": fireplace,
    "Rooms": rooms,
    "SpecialConditions": specialConditions,
    "PropertyFeatures": propertyFeatures,
    "LandSize": landSize,
    "retsFeed_id": retsFeedId,
    "send_to_friend_count": sendToFriendCount,
    "has_other_feed_version": hasOtherFeedVersion,
    "ListingAdded": listingAdded,
    "created": created?.toIso8601String(),
    "alias": alias,
    "MileMarker": mileMarker,
    "MileMarkerArea": mileMarkerArea,
    "ListingArea": listingArea,
    "other_1": other1,
    "other_2": other2,
    "other_3": other3,
    "other_4": other4,
    "other_5": other5,
    "other_6": other6,
    "other_7": other7,
    "other_8": other8,
    "other_9": other9,
    "other_10": other10,
    "status": status,
    "coord_source": coordSource,
    "offline": offline,
    "offline_photos": offlinePhotos,
    "featured_image": featuredImage,
    "admin_id": adminId,
    "rets_feed": retsFeed?.toJson(),
    "property_photos": propertyPhotos == null ? [] : List<dynamic>.from(propertyPhotos!.map((x) => x.toJson())),
    "office": office?.toJson(),
    "agent": agent?.toJson(),
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
}

class Agent {
  int? id;
  String? agentId;
  String? firstName;
  String? lastName;
  String? officePhone;
  String? agentStateLicense;
  DateTime? modificationTimestamp;
  String? firmId;
  int? retsFeedId;
  dynamic officeId;
  String? cellPhone;
  dynamic fax;
  String? email;
  dynamic url;
  String? city;
  String? stateOrProvince;
  String? postalCode;
  dynamic agentStatus;
  String? agentUid;
  String? officeUid;
  dynamic boardId;
  dynamic agentType;
  String? alias;
  String? fullName;

  Agent({
    this.id,
    this.agentId,
    this.firstName,
    this.lastName,
    this.officePhone,
    this.agentStateLicense,
    this.modificationTimestamp,
    this.firmId,
    this.retsFeedId,
    this.officeId,
    this.cellPhone,
    this.fax,
    this.email,
    this.url,
    this.city,
    this.stateOrProvince,
    this.postalCode,
    this.agentStatus,
    this.agentUid,
    this.officeUid,
    this.boardId,
    this.agentType,
    this.alias,
    this.fullName,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
    id: json["id"],
    agentId: json["AgentID"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    officePhone: json["OfficePhone"],
    agentStateLicense: json["AgentStateLicense"],
    modificationTimestamp: json["ModificationTimestamp"] == null ? null : DateTime.parse(json["ModificationTimestamp"]),
    firmId: json["FirmID"],
    retsFeedId: json["retsFeed_id"],
    officeId: json["OfficeId"],
    cellPhone: json["CellPhone"],
    fax: json["Fax"],
    email: json["Email"],
    url: json["URL"],
    city: json["City"],
    stateOrProvince: json["StateOrProvince"],
    postalCode: json["PostalCode"],
    agentStatus: json["AgentStatus"],
    agentUid: json["AgentUID"],
    officeUid: json["OfficeUID"],
    boardId: json["BoardId"],
    agentType: json["AgentType"],
    alias: json["alias"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "AgentID": agentId,
    "FirstName": firstName,
    "LastName": lastName,
    "OfficePhone": officePhone,
    "AgentStateLicense": agentStateLicense,
    "ModificationTimestamp": modificationTimestamp?.toIso8601String(),
    "FirmID": firmId,
    "retsFeed_id": retsFeedId,
    "OfficeId": officeId,
    "CellPhone": cellPhone,
    "Fax": fax,
    "Email": email,
    "URL": url,
    "City": city,
    "StateOrProvince": stateOrProvince,
    "PostalCode": postalCode,
    "AgentStatus": agentStatus,
    "AgentUID": agentUid,
    "OfficeUID": officeUid,
    "BoardId": boardId,
    "AgentType": agentType,
    "alias": alias,
    "full_name": fullName,
  };
}

class Office {
  int? id;
  String? name;
  String? officeStateLicense;
  String? officePhone;
  String? fax;
  String? email;
  String? url;
  String? streetAddress;
  String? streetAdditionalInfo;
  String? city;
  String? stateOrProvince;
  String? postalCode;
  String? listingServiceName;
  DateTime? modificationTimestamp;
  String? officeStatus;
  String? officeId;
  String? officeUid;
  String? firmId;
  String? boardId;
  String? officeIdx;
  int? retsFeedId;

  Office({
    this.id,
    this.name,
    this.officeStateLicense,
    this.officePhone,
    this.fax,
    this.email,
    this.url,
    this.streetAddress,
    this.streetAdditionalInfo,
    this.city,
    this.stateOrProvince,
    this.postalCode,
    this.listingServiceName,
    this.modificationTimestamp,
    this.officeStatus,
    this.officeId,
    this.officeUid,
    this.firmId,
    this.boardId,
    this.officeIdx,
    this.retsFeedId,
  });

  factory Office.fromJson(Map<String, dynamic> json) => Office(
    id: json["id"],
    name: json["Name"],
    officeStateLicense: json["OfficeStateLicense"],
    officePhone: json["OfficePhone"],
    fax: json["Fax"],
    email: json["Email"],
    url: json["URL"],
    streetAddress: json["StreetAddress"],
    streetAdditionalInfo: json["StreetAdditionalInfo"],
    city: json["City"],
    stateOrProvince: json["StateOrProvince"],
    postalCode: json["PostalCode"],
    listingServiceName: json["ListingServiceName"],
    modificationTimestamp: json["ModificationTimestamp"] == null ? null : DateTime.parse(json["ModificationTimestamp"]),
    officeStatus: json["OfficeStatus"],
    officeId: json["OfficeID"],
    officeUid: json["OfficeUID"],
    firmId: json["FirmID"],
    boardId: json["BoardID"],
    officeIdx: json["OfficeIDX"],
    retsFeedId: json["retsFeed_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Name": name,
    "OfficeStateLicense": officeStateLicense,
    "OfficePhone": officePhone,
    "Fax": fax,
    "Email": email,
    "URL": url,
    "StreetAddress": streetAddress,
    "StreetAdditionalInfo": streetAdditionalInfo,
    "City": city,
    "StateOrProvince": stateOrProvince,
    "PostalCode": postalCode,
    "ListingServiceName": listingServiceName,
    "ModificationTimestamp": modificationTimestamp?.toIso8601String(),
    "OfficeStatus": officeStatus,
    "OfficeID": officeId,
    "OfficeUID": officeUid,
    "FirmID": firmId,
    "BoardID": boardId,
    "OfficeIDX": officeIdx,
    "retsFeed_id": retsFeedId,
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

class RetsFeed {
  int? id;
  DateTime? lastUpdate;

  RetsFeed({
    this.id,
    this.lastUpdate,
  });

  factory RetsFeed.fromJson(Map<String, dynamic> json) => RetsFeed(
    id: json["id"],
    lastUpdate: json["last_update"] == null ? null : DateTime.parse(json["last_update"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "last_update": lastUpdate?.toIso8601String(),
  };
}
