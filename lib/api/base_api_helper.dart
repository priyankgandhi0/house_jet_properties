import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:house_jet_properties/constants/request_const.dart';
import 'package:house_jet_properties/models/response_item_model/response_item.dart';
import 'package:house_jet_properties/utils/app_routes.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';


import 'api_exception.dart';


class BaseApiHelper {

  static Future<ResponseItem> postRequest(String requestUrl,
      dynamic requestData,
      bool passAuthToken,) async
  {
    Dio dio = Dio();
    log('request:$requestUrl', name: 'POST');
    log('request --> body :${json.encode(requestData)}');

    // if (!isMultipart) {
    //   var data = json.encode(requestData);
    //
    //   log('body:${json.encode(requestData)}');
    // } else {
    //   log('Authorization: ${preferences.getString(SharedPreference.AUTH_TOKEN)}',
    //       name: 'POST_HEADER');
    // }
    // FormData? formData;
    // if(!setAsMap){
    //    formData = FormData.fromMap(requestData);
    // }
    return await dio
        .post(
      requestUrl,
      data: requestData,
      options: passAuthToken
          ? Options(
        headers: {
          'Authorization': 'bearer ${preferences.getString(
              SharedPreference.AUTH_TOKEN)}'
        },
      )
          : null,
    )
        .then((value) => onValue(value))
        .onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> uploadMultipartImageRequest(String requestUrl,
      dynamic requestData,
      bool passAuthToken,) async
  {
    log('request:$requestUrl', name: 'MULTIPART REQUEST');
    log('request --> body :${json.encode(requestData)}');
    //log('request --> body :$requestData ', name: 'REQUEST BODY');
    FormData formData;
    formData = FormData.fromMap(requestData);

    Dio dio = Dio();

    return await dio
        .post(
        requestUrl,
        data: formData,
        options: passAuthToken
            ? Options(
          headers: {
            'Authorization': 'bearer ${preferences.getString(
                SharedPreference.AUTH_TOKEN)}'
          },
        ):null

    )
        .then((value) => onValue(value))
        .onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> multipartPutRequest(String requestUrl,
      dynamic requestData,
      bool passAuthToken,) async
  {
    log('request:$requestUrl', name: 'MULTIPART REQUEST');
    log('request --> body :${json.encode(requestData)}');
    //log('request --> body :$requestData ', name: 'REQUEST BODY');
    FormData formData;
    formData = FormData.fromMap(requestData);

    Dio dio = Dio();

    return await dio
        .put(
      requestUrl,
      data: formData,
      options: passAuthToken
          ? Options(
        headers: {
          'Authorization': 'bearer ${preferences.getString(
              SharedPreference.AUTH_TOKEN)}'
        },
      )
          : null,

    )
        .then((value) => onValue(value))
        .onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> putRequest(String requestUrl,
      Map<String, dynamic> requestData,
      bool passAuthToken,
      [bool isMultipart = false, bool setAsMap = false]) async
  {
    Dio dio = Dio();
    log('request:$requestUrl', name: 'PUT');


    log('request --> body :${json.encode(requestData)}');
    // if (!isMultipart) {
    //   var data = json.encode(requestData);
    //   debugPrint("Data Body === $data");
    //   log('body:---->${json.encode(requestData)}');
    // } else {
    //   log('Authorization: ${preferences.getString(SharedPreference.AUTH_TOKEN)}',
    //       name: 'PUT_HEADER');
    // }
    // FormData? formData;
    // if(!setAsMap){
    //    formData = FormData.fromMap(requestData);
    // }

    return await dio.put(
      requestUrl,
      data: requestData,
      options: passAuthToken
          ? Options(
        headers: {
          'Authorization': 'bearer ${preferences.getString(
              SharedPreference.AUTH_TOKEN)}'
        },
      )
          : null,
    )
        .then((value) => onValue(value))
        .onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> getRequest(String requestUrl,
      [bool passAuthToken = false, CancelToken? cancelToken]) async {
    Dio dio = Dio();
    log('request:$requestUrl', name: 'GET');


    if (passAuthToken) {
      log('Authorization: ${preferences.getString(
          SharedPreference.AUTH_TOKEN)}',
          name: 'GET_HEADER');
    }

    return await dio.get(
      requestUrl,
      cancelToken: cancelToken,
      options: passAuthToken
          ? Options(
        headers: {
          'Authorization': 'bearer ${preferences.getString(
              SharedPreference.AUTH_TOKEN)}'
        },
      )
          : null,
    )
        .then((value) => onValue(value))
        .catchError((err) {
      if (CancelToken.isCancel(err as DioError)) {
        log('request:$requestUrl', name: 'GET_CANCEL');
        return ResponseItem(
            message: 'Request cancelled', status: false, forceLogout: true);
      }
    }).onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> getRequestWithQry(String requestUrl,
      Map<String, dynamic> queryParameters,
      [bool passAuthToken = false, CancelToken? cancelToken]) async {
    Dio dio = Dio();
    log('request:$requestUrl params:$queryParameters', name: 'GET');

    log('request --> body :$queryParameters', name: 'REQUEST PARAMS');

    // log('Params:$queryParameters');
    if (passAuthToken) {
      log('Authorization: ${preferences.getString(
          SharedPreference.AUTH_TOKEN)}',
          name: 'GET_HEADER');
    }

    return await dio
        .get(
      requestUrl,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
      options: passAuthToken
          ? Options(
        headers: {
          'Authorization': 'bearer ${preferences.getString(
              SharedPreference.AUTH_TOKEN)}'
        },
      )
          : null,

    )
        .then((value) => onValue(value))
        .catchError((err) {
      if (CancelToken.isCancel(err as DioError)) {
        log('request:$requestUrl', name: 'GET_CANCEL');
        return ResponseItem(
            message: 'Request cancelled', status: false, forceLogout: true);
      }
    }).onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> patchRequest(String requestUrl,
      Map<String, dynamic> requestData,
      [bool passAuthToken = false, bool isMultipart = false]) async {
    Dio dio = Dio();
    // log('request:$requestUrl', name: 'PATCH');
    // if (!isMultipart) {
    //   log('body:${json.encode(requestData)}');
    // }
    // if (passAuthToken) {
    //   log('Authorization: ${preferences.getString(SharedPreference.AUTH_TOKEN)}',
    //       name: 'PATCH_HEADER');
    // }

    // var formData = FormData.fromMap(requestData);
    return await dio
        .patch(
      requestUrl,
      data: requestData,
      options: passAuthToken
          ? Options(
        headers: {
          'Authorization': 'bearer ${preferences.getString(
              SharedPreference.AUTH_TOKEN)}'
        },
      )
          : null,

    )
        .then((value) => onValue(value))
        .onError((error, stackTrace) => onError(error));
  }


  static Future<ResponseItem> deleteRequest(String requestUrl,
      [bool passAuthToken = false]) async {
    Dio dio = Dio();
    log('request:$requestUrl', name: 'DELETE');


    if (passAuthToken) {
      log('Authorization: ${preferences.getString(
          SharedPreference.AUTH_TOKEN)}',
          name: 'DELETE_HEADER');
    }

    return await dio
        .delete(
      requestUrl,
      options: passAuthToken
          ? Options(
        headers: {
          'Authorization': 'bearer ${preferences.getString(
              SharedPreference.AUTH_TOKEN)}'
        },
      )
          : null,

    )
        .then((value) => onValue(value))
        .onError((error, stackTrace) => onError(error));
  }


  static Future onValue(Response response) async {
    ResponseItem result;

    dynamic responseData = response.data;
    bool status = false;
    String message;
    dynamic data = responseData;

    log('responseCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      status = true;
      message = '';
      data = responseData;
    } else {
      log('response: ${json.encode(data)}');
      message = responseData['error'] ?? errorText;
    }
    result = ResponseItem(
      data: data,
      message: message,
      status: status,
    );
    log('response: ${json.encode(result.toJson())}', name: 'House Jet');
    log('message: ${result.message}', name: 'message');

    return result;
  }

  static onError(error) {
    log('Error caused: $error');
    bool status = false;
    String message = 'Unsuccessful request';
    if (error is DioError) {
      if (error.response?.statusCode == 401) {
        if (error.response?.data['message'] != null) {
          if ((error.response?.data['message']).toString().toLowerCase() ==
              'token not match') {
            // box.write(AppConstants.isTutorialDone, true);
            getx.Get.offNamedUntil(Routes.loginScreen, (route) => false);
            return ResponseItem(
                data: null,
                message: error.response?.data['message'],
                status: status);
          }
        }
      }
      if (error.response?.data['errors'] != null) {
        message = error.response?.data['errors'];
      } else if (error.response?.data['error'] != null) {
        message = error.response?.data['error'];
      }
    } else if (error is SocketException) {
      message = ResponseException('No internet connection').toString();
    } else if (error is FormatException) {
      message = ResponseException('Something wrong in response.').toString() +
          error.toString();
    }
    return ResponseItem(data: null, message: message, status: status);
  }
}


