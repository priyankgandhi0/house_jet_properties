

import 'package:flutter/material.dart';

const googlePlaceApiKey = 'AIzaSyCC_GrO0peF27v5Uf2hgsnkoFGbT4ga9kw';
String errorText = "Something want wrong";
ValueNotifier<bool> hasInternet = ValueNotifier(true);



class AppUrls {
  static const String baseUrlV1 = "https://listhub.ppc.staging.marketmakerleads.net/api/v1";
  static const String baseUrlPub = "https://listhub.ppc.staging.marketmakerleads.net/api/pub";

  static const String baseUrl =
      "https://listhub.ppc.staging.marketmakerleads.net";

  static const String baseImgUrl = "https://";



// const bool isLive = false;
/// Create request with query parameter
}

const int LIMIT = 20;




class MethodNames {
  static const userLogin = "/login/mobile-lead";
  static const userRegistration = "/client-leads/register?XDEBUG_SESSION_START=PHPSTORM&source=HouseJet-Registration";
  static const getAllProperties = "/properties/search/map";

  static const getPropertiesByAlias = "/properties/get-by-alias/";

}

class RequestParam {
  static const service = "Service"; // -> pass method name
  static const showError = "show_error"; // -> bool in String
  static const showDebugPhotoStorm = "?log-view=1&XDEBUG_SESSION_START=PHPSTORM";
}

class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const userAgent = "User-Agent";
  static const appSecret = "App-Secret";
  static const appTrackVersion = "App-Track-Version";
  static const appDeviceType = "App-Device-Type";
  static const appStoreVersion = "App-Store-Version";
  static const appDeviceModel = "App-Device-Model";
  static const appOsVersion = "App-Os-Version";
  static const appStoreBuildNumber = "App-Store-Build-Number";
  static const authToken = "Auth-Token";
  static const accessControlAllowOrigin = "Access-Control-Allow-Origin";
}

