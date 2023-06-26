// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? success;
  String? token;
  int? expires;
  Admin? admin;
  RegistrationResponse? registrationResponse;
  String? headConversionCode;
  String? bodyConversionCode;
  dynamic error;



  LoginModel({
    this.success,
    this.token,
    this.expires,
    this.admin,
    this.registrationResponse,
    this.headConversionCode,
    this.bodyConversionCode,
    this.error,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    token: json["token"],
    expires: json["expires"],
    admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
    registrationResponse: json["response"] == null?null:RegistrationResponse.fromJson(json["response"]),
    headConversionCode: json["head_conversion_code"],
    bodyConversionCode: json["body_conversion_code"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "token": token,
    "expires": expires,
    "admin": admin?.toJson(),
    "error": error,
    "response":registrationResponse!.toJson(),
    "head_conversion_code":bodyConversionCode.toString(),
    "body_conversion_code":bodyConversionCode.toString(),
  };
}

class Admin {
  int? id;
  String? firstname;
  String? lastname;
  String? alias;
  String? cPhone;
  String? email;
  String? username;
  String? status;
  DateTime? created;
  String? timezone;
  HouseJetMembership? houseJetMembership;
  String? fullName;

  bool? isCrmAgent;
  String? role;
  bool? superAdmin;
  bool? superDeveloper;
  bool? isFree;
  List<dynamic>? socialLinks;
  String? bioText;

  Admin({
    this.id,
    this.firstname,
    this.lastname,
    this.alias,
    this.cPhone,
    this.email,
    this.username,
    this.status,
    this.created,
    this.timezone,
    this.houseJetMembership,
    this.fullName,
    this.isCrmAgent,
    this.role,
    this.superAdmin,
    this.superDeveloper,
    this.isFree,
    this.socialLinks,
    this.bioText,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    alias: json["alias"],
    cPhone: json["c_phone"],
    email: json["email"],
    username: json["username"],
    status: json["status"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    timezone: json["timezone"],
    houseJetMembership: json["house_jet_membership"] == null ? null : HouseJetMembership.fromJson(json["house_jet_membership"]),
    fullName: json["full_name"],
    isCrmAgent: json["is_crm_agent"],
    role: json["role"],
    superAdmin: json["super_admin"],
    superDeveloper: json["super_developer"],
    isFree: json["is_free"],
    socialLinks: json["social_links"] == null ? [] : List<dynamic>.from(json["social_links"]!.map((x) => x)),
    bioText: json["bio_text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "alias": alias,
    "c_phone": cPhone,
    "email": email,
    "username": username,
    "status": status,
    "created": created?.toIso8601String(),
    "timezone": timezone,
    "house_jet_membership": houseJetMembership?.toJson(),
    "full_name": fullName,
    "is_crm_agent": isCrmAgent,
    "role": role,
    "super_admin": superAdmin,
    "super_developer": superDeveloper,
    "is_free": isFree,
    "social_links": socialLinks == null ? [] : List<dynamic>.from(socialLinks!.map((x) => x)),
    "bio_text": bioText,
  };
}


class CustomGroup {
  dynamic id;
  dynamic name;
  int? leadCount;

  CustomGroup({
    this.id,
    this.name,
    this.leadCount,
  });

  factory CustomGroup.fromJson(Map<String, dynamic> json) => CustomGroup(
    id: json["id"],
    name: json["name"],
    leadCount: json["lead_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lead_count": leadCount,
  };
}

class HouseJetMembership {
  int? id;
  int? siteId;
  int? adminId;
  int? billingProfileId;
  int? status;
  int? amount;
  int? billDayOfMonth;
  DateTime? lastBillDate;
  DateTime? nextBillDate;
  dynamic suspendDate;
  dynamic cancelledDate;
  DateTime? created;
  DateTime? modified;
  dynamic bundledPrice;
  bool? isSuspendExpired;
  bool? isWasSuspended;
  bool? isSuspended;
  bool? suspendExpirationDate;
  bool? isCanceled;
  bool? isActive;
  bool? isActiveStatus;
  bool? isSuspendedStatus;

  HouseJetMembership({
    this.id,
    this.siteId,
    this.adminId,
    this.billingProfileId,
    this.status,
    this.amount,
    this.billDayOfMonth,
    this.lastBillDate,
    this.nextBillDate,
    this.suspendDate,
    this.cancelledDate,
    this.created,
    this.modified,
    this.bundledPrice,
    this.isSuspendExpired,
    this.isWasSuspended,
    this.isSuspended,
    this.suspendExpirationDate,
    this.isCanceled,
    this.isActive,
    this.isActiveStatus,
    this.isSuspendedStatus,
  });

  factory HouseJetMembership.fromJson(Map<String, dynamic> json) => HouseJetMembership(
    id: json["id"],
    siteId: json["site_id"],
    adminId: json["admin_id"],
    billingProfileId: json["billing_profile_id"],
    status: json["status"],
    amount: json["amount"],
    billDayOfMonth: json["bill_day_of_month"],
    lastBillDate: json["last_bill_date"] == null ? null : DateTime.parse(json["last_bill_date"]),
    nextBillDate: json["next_bill_date"] == null ? null : DateTime.parse(json["next_bill_date"]),
    suspendDate: json["suspend_date"],
    cancelledDate: json["cancelled_date"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    bundledPrice: json["bundled_price"],
    isSuspendExpired: json["is_suspend_expired"],
    isWasSuspended: json["is_was_suspended"],
    isSuspended: json["is_suspended"],
    suspendExpirationDate: json["suspend_expiration_date"],
    isCanceled: json["is_canceled"],
    isActive: json["is_active"],
    isActiveStatus: json["is_active_status"],
    isSuspendedStatus: json["is_suspended_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "site_id": siteId,
    "admin_id": adminId,
    "billing_profile_id": billingProfileId,
    "status": status,
    "amount": amount,
    "bill_day_of_month": billDayOfMonth,
    "last_bill_date": lastBillDate?.toIso8601String(),
    "next_bill_date": nextBillDate?.toIso8601String(),
    "suspend_date": suspendDate,
    "cancelled_date": cancelledDate,
    "created": created?.toIso8601String(),
    "modified": modified?.toIso8601String(),
    "bundled_price": bundledPrice,
    "is_suspend_expired": isSuspendExpired,
    "is_was_suspended": isWasSuspended,
    "is_suspended": isSuspended,
    "suspend_expiration_date": suspendExpirationDate,
    "is_canceled": isCanceled,
    "is_active": isActive,
    "is_active_status": isActiveStatus,
    "is_suspended_status": isSuspendedStatus,
  };
}




class RegistrationResponse {
  User? user;
  String? redirect;

  RegistrationResponse({
    this.user,
    this.redirect,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => RegistrationResponse(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    redirect: json["redirect"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "redirect": redirect,
  };
}

class User {
  String? phone;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? acceptedTermsOfUse;
  String? registrationUrl;
  String? type;
  String? rating;
  String? origin;
  DateTime? loginTime;
  int? countLogin;
  DateTime? created;
  DateTime? modified;
  String? siteId;
  String? ipAddress;
  double? latitude;
  double? longitude;
  String? userNew;
  int? leadSourceId;
  dynamic leadState;
  String? country;
  String? authKey;
  String? panelLeadType;
  int? groupId;
  dynamic priceRangeFrom;
  dynamic priceRangeTo;
  String? isVerified;
  String? leadStatus;
  String? mortgagePartnerStatus;
  String? emailAlert;
  String? listingAlerts;
  String? unsubscribe;
  String? behavioralEmailsEnabled;
  int? id;
  int? pipelineGroupId;
  DateTime? pipelineGroupArrived;
  String? fullName;
  String? source;
  String? profileImage;
  dynamic displayAddress;
  bool? verified;
  String? alphaId;
  List<String>? smartListHash;
  String? smartListHashString;
  bool? worked;
  String? jwtHash;

  User({
    this.phone,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.acceptedTermsOfUse,
    this.registrationUrl,
    this.type,
    this.rating,
    this.origin,
    this.loginTime,
    this.countLogin,
    this.created,
    this.modified,
    this.siteId,
    this.ipAddress,
    this.latitude,
    this.longitude,
    this.userNew,
    this.leadSourceId,
    this.leadState,
    this.country,
    this.authKey,
    this.panelLeadType,
    this.groupId,
    this.priceRangeFrom,
    this.priceRangeTo,
    this.isVerified,
    this.leadStatus,
    this.mortgagePartnerStatus,
    this.emailAlert,
    this.listingAlerts,
    this.unsubscribe,
    this.behavioralEmailsEnabled,
    this.id,
    this.pipelineGroupId,
    this.pipelineGroupArrived,
    this.fullName,
    this.source,
    this.profileImage,
    this.displayAddress,
    this.verified,
    this.alphaId,
    this.smartListHash,
    this.smartListHashString,
    this.worked,
    this.jwtHash,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    phone: json["phone"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    name: json["name"],
    email: json["email"],
    acceptedTermsOfUse: json["accepted_terms_of_use"],
    registrationUrl: json["registration_url"],
    type: json["type"],
    rating: json["rating"].toString(),
    origin: json["origin"],
    loginTime: json["login_time"] == null ? null : DateTime.parse(json["login_time"]),
    countLogin: json["count_login"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    siteId: json["site_id"],
    ipAddress: json["ip_address"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    userNew: json["new"],
    leadSourceId: json["lead_source_id"],
    leadState: json["lead_state"],
    country: json["country"],
    authKey: json["auth_key"],
    panelLeadType: json["panel_lead_type"],
    groupId: json["group_id"],
    priceRangeFrom: json["price_range_from"],
    priceRangeTo: json["price_range_to"],
    isVerified: json["is_verified"],
    leadStatus: json["lead_status"],
    mortgagePartnerStatus: json["mortgage_partner_status"],
    emailAlert: json["email_alert"],
    listingAlerts: json["listing_alerts"],
    unsubscribe: json["unsubscribe"],
    behavioralEmailsEnabled: json["behavioral_emails_enabled"],
    id: json["id"],
    pipelineGroupId: json["pipeline_group_id"],
    pipelineGroupArrived: json["pipeline_group_arrived"] == null ? null : DateTime.parse(json["pipeline_group_arrived"]),
    fullName: json["full_name"],
    source: json["source"],
    profileImage: json["profile_image"],
    displayAddress: json["display_address"],
    verified: json["verified"],
    alphaId: json["alpha_id"],
    smartListHash: json["smart_list_hash"] == null ? [] : List<String>.from(json["smart_list_hash"]!.map((x) => x)),
    smartListHashString: json["smart_list_hash_string"],
    worked: json["worked"],
    jwtHash: json["jwt_hash"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "first_name": firstName,
    "last_name": lastName,
    "name": name,
    "email": email,
    "accepted_terms_of_use": acceptedTermsOfUse,
    "registration_url": registrationUrl,
    "type": type,
    "rating": rating,
    "origin": origin,
    "login_time": loginTime?.toIso8601String(),
    "count_login": countLogin,
    "created": created?.toIso8601String(),
    "modified": modified?.toIso8601String(),
    "site_id": siteId,
    "ip_address": ipAddress,
    "latitude": latitude,
    "longitude": longitude,
    "new": userNew,
    "lead_source_id": leadSourceId,
    "lead_state": leadState,
    "country": country,
    "auth_key": authKey,
    "panel_lead_type": panelLeadType,
    "group_id": groupId,
    "price_range_from": priceRangeFrom,
    "price_range_to": priceRangeTo,
    "is_verified": isVerified,
    "lead_status": leadStatus,
    "mortgage_partner_status": mortgagePartnerStatus,
    "email_alert": emailAlert,
    "listing_alerts": listingAlerts,
    "unsubscribe": unsubscribe,
    "behavioral_emails_enabled": behavioralEmailsEnabled,
    "id": id,
    "pipeline_group_id": pipelineGroupId,
    "pipeline_group_arrived": pipelineGroupArrived?.toIso8601String(),
    "full_name": fullName,
    "source": source,
    "profile_image": profileImage,
    "display_address": displayAddress,
    "verified": verified,
    "alpha_id": alphaId,
    "smart_list_hash": smartListHash == null ? [] : List<dynamic>.from(smartListHash!.map((x) => x)),
    "smart_list_hash_string": smartListHashString,
    "worked": worked,
    "jwt_hash": jwtHash,
  };
}

