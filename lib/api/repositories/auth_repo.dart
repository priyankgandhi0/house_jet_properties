import 'dart:io';


import 'package:dio/dio.dart';
import 'package:house_jet_properties/api/base_api_helper.dart';
import 'package:house_jet_properties/constants/request_const.dart';

import 'package:house_jet_properties/models/response_item_model/response_item.dart';

AuthRepo logIn = AuthRepo();


class AuthRepo {
  Future<ResponseItem> userLogin(String userName, String password) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String message = "";

    String requestUrl = '${AppUrls.baseUrlV1}${MethodNames.userLogin}';

    result = await BaseApiHelper.postRequest(
        requestUrl, {
      "username" : userName,
      "password":password,

    }, false);
    status = result.status;
    data = result.data;
    message = result.message;
    return ResponseItem(data: data, message: message, status: status);
  }
  Future<ResponseItem> userRegistering(
      String userName,
      String email,
      String phoneNumber
      ) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String message = "";

    String requestUrl = '${AppUrls.baseUrlPub}${MethodNames.userRegistration}';

    result = await BaseApiHelper.postRequest(
        requestUrl,{
      "phone" : phoneNumber,
      "name" : userName,
      "email" : email,
      "accepted_terms_of_use" : 1,
      "registration_url" : "https://housejet.com",
      "type" : "buyer"
    }, false);
    status = result.status;
    data = result.data;
    message = result.message;
    return ResponseItem(data: data, message: message, status: status);
  }



  // Future<ResponseItem> updateUser(
  //     String? userName,
  //     String? email,
  //     File? profileImage
  //     ) async {
  //   ResponseItem result;
  //   bool status = true;
  //   dynamic data;
  //   String message = "";
  //   MultipartFile? file;
  //   String requestUrl = '${AppUrls.baseUrl}${MethodNames.updateUser}';
  //   if (profileImage != null){
  //     String fileName = profileImage.path
  //         .split('/')
  //         .last;
  //   file = await MultipartFile.fromFile(profileImage.path, filename: fileName);
  // }
  //
  //   result = await BaseApiHelper.multipartPutRequest(
  //       requestUrl,{
  //     "user_name" : userName,
  //     "user_email" : email,
  //     "image":file,
  //
  //   }, false);
  //   status = result.status;
  //   data = result.data;
  //   message = result.message;
  //   return ResponseItem(data: data, message: message, status: status);
  // }
  //
  // Future<ResponseItem> putFirebasePushToken(
  //     String pushToken,
  //     ) async {
  //   ResponseItem result;
  //   bool status = true;
  //   dynamic data;
  //   String message = "";
  //
  //   String requestUrl = '${AppUrls.baseUrl}${MethodNames.devicePushToken}';
  //
  //   result = await BaseApiHelper.putRequest(
  //       requestUrl,  {
  //     "device_push_token":pushToken,
  //   }, true);
  //   status = result.status;
  //   data = result.data;
  //   message = result.message;
  //   return ResponseItem(data: data, message: message, status: status);
  // }



}