// ignore_for_file: constant_identifier_names

import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import '../models/get_loged_in_user_profile_model.dart';

final preferences = SharedPreference();

class SharedPreference {
  SharedPreferences? _preferences;

  init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static const String IS_LOGGED_IN = "isLoggedIn";
  static const String USER_EMAIL = "userEmail";
  static const String USER_INFO = "userInfo";

  static const APP_DEVICE_TYPE = "App-Device-Type";
  static const APP_STORE_VERSION = "App-Store-Version";
  static const APP_DEVICE_MODEL = "App-Device-Model";
  static const APP_OS_VERSION = "App-Os-Version";
  static const APP_STORE_BUILD_NUMBER = "App-Store-Build-Number";
  static const AUTH_TOKEN = "Auth-Token";
  static const REMEMBER_PASSWORD = "remember";

  static const USER_ID = "userId";
  static const AGENT_ID = "agentId";
  static const CONTACT_ID = "contactId";
  static const CONTACT_FULL_NAME = "contactfullname";
  static const APPOINTMENT_START_DATE = "start_date_appointment";
  static const APPOINTMENT_END_DATE = "end_date_appointment";

  static const AGENT_PROFILE_DATA = "agent_profile_data";
  static const RECENTLY_VIEWED_LIST = "recently_viewed_list";

  void clearUserItem() async {
    _preferences!.remove(IS_LOGGED_IN);
  }

  static UserData? getUserModel() {
    String encodedModel = preferences.getString(AGENT_PROFILE_DATA) ?? "";
    if (encodedModel.isEmpty) {
      return null;
    } else {
      Map<String, dynamic> model = jsonDecode(encodedModel);
      return UserData.fromJson(model);
    }
  }

  /*putAppDeviceInfo() async {
    if (kIsWeb) {
      putString(APP_DEVICE_MODEL, "Test");
      putString(APP_OS_VERSION, "Web 1.0");
      putString(APP_STORE_VERSION, "1.0.0");
      putString(APP_STORE_BUILD_NUMBER, "1.0.0");
      putString(APP_DEVICE_TYPE, "web");
    } else {
      bool isiOS = Platform.isIOS;
      putString(APP_DEVICE_TYPE, isiOS ? "iOS" : "android");
      var deviceInfo = await appDeviceInfo();
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      if (isiOS) {
        IosDeviceInfo iosDeviceInfo = (deviceInfo as IosDeviceInfo);
        putString(APP_DEVICE_MODEL, deviceInfo.model);
        putString(APP_OS_VERSION, "iOS ${iosDeviceInfo.systemVersion}");
      } else {
        AndroidDeviceInfo androidDeviceInfo = (deviceInfo as AndroidDeviceInfo);
        putString(APP_DEVICE_MODEL, androidDeviceInfo.model);
        putString(APP_OS_VERSION, androidDeviceInfo.version.release);
      }
      putString(APP_STORE_VERSION, packageInfo.version);
      putString(APP_STORE_BUILD_NUMBER, packageInfo.buildNumber);
    }
  }
  Future<dynamic> appDeviceInfo() async {
    return Platform.isIOS
        ? await DeviceInfoPlugin().iosInfo
        : await DeviceInfoPlugin().androidInfo;
  }*/

  Future<bool?> putString(String key, String value) async {
    return _preferences == null ? null : _preferences!.setString(key, value);
  }

  Future<bool?> putList(String key, List<String> value) async {
    return _preferences == null
        ? null
        : _preferences!.setStringList(key, value);
  }

  List<String>? getList(String key, {List<String> defValue = const []}) {
    return _preferences == null
        ? defValue
        : _preferences!.getStringList(key) ?? defValue;
  }

  String? getString(String key, {String defValue = ""}) {
    return _preferences == null
        ? defValue
        : _preferences!.getString(key) ?? defValue;
  }

  Future<bool?> putInt(String key, int value) async {
    return _preferences == null ? null : _preferences!.setInt(key, value);
  }

  int? getInt(String key, {int defValue = 0}) {
    return _preferences == null
        ? defValue
        : _preferences!.getInt(key) ?? defValue;
  }

  Future<bool?> putDouble(String key, double value) async {
    return _preferences == null ? null : _preferences!.setDouble(key, value);
  }

  double getDouble(String key, {double defValue = 0.0}) {
    return _preferences == null
        ? defValue
        : _preferences!.getDouble(key) ?? defValue;
  }

  Future<bool?> putBool(String key, bool value) async {
    return _preferences == null ? null : _preferences!.setBool(key, value);
  }

  bool? getBool(String key, {bool defValue = false}) {
    return _preferences == null
        ? defValue
        : _preferences!.getBool(key) ?? defValue;
  }
}
