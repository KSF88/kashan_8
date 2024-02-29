/* import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_1/data/app_exceptions.dart';
import 'package:flutter_application_1/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class networkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    ///
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
            Duration(seconds: 10),
          );
      jsonResponse = ReturnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonResponse;
  }

  ///

  ///
  dynamic ReturnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(
          response.body.toString(),
        );
      case 404:
        throw UnAuthorizedException(
          response.body.toString(),
        );
      default:
        FetchDataException(
          "Error during communication" +
              "with status code" +
              response.statusCode.toString(),
        );
    }
  }
  ///
}
 */