
import 'package:house_jet_properties/api/base_api_helper.dart';
import 'package:house_jet_properties/constants/request_const.dart';
import 'package:house_jet_properties/models/response_item_model/response_item.dart';
import 'package:house_jet_properties/theme/app_strings.dart';

HomeRepo homeRepo = HomeRepo();


class HomeRepo {



  Future<ResponseItem> getAllProperties({
    dynamic bathroomsCount,
    dynamic bedroomsCount,
    List? priceRangeList,
    String? subType,

}) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String message = "";

    String requestUrl =
        '${AppUrls.baseUrlV1}${MethodNames.getAllProperties}';

    result = await BaseApiHelper.postRequest(
      requestUrl,

        {
          "criteria": {
            "param": {
              "bathrooms": bathroomsCount,
              "bedrooms": bedroomsCount,
              "location": null,
              "price_range": priceRangeList,
              "subtype" : subType!
            }
          }
        },

      true,
    );
    status = result.status;
    data = result.data;
    message = result.message;
    return ResponseItem(data: data, message: message, status: status);
  }


  Future<ResponseItem> getPropertyByAlias({
    String? aliasName,
  }) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String message = "";
    // var queryParameters = {RequestParam.service:MethodNames.getPropertiesByAlias};
    // String queryString = Uri(queryParameters: queryParameters).query;
    //
    // String requestUrl = ApiUrl.baseUrl + queryString;
    String requestUrl =
        '${AppUrls.baseUrlV1}${MethodNames.getPropertiesByAlias}$aliasName${RequestParam.showDebugPhotoStorm}';

    result = await BaseApiHelper.getRequest(
      requestUrl,
      true,
    );
    status = result.status;
    data = result.data;
    message = result.message;
    return ResponseItem(data: data, message: message, status: status);
  }

}