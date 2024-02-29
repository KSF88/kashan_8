import 'dart:convert';
import 'package:flutter_application_1/configs/app_colors/app_constants.dart';
import 'package:flutter_application_1/data/app_exceptions.dart';
import 'package:flutter_application_1/model/NewsChannelHeadlinesModel.dart';
import 'package:flutter_application_1/model/categories_news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {

  //handle response of api call

  dynamic _handleApiResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic data = jsonDecode(response.body);
        return data;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error during communication with status code ${response.statusCode}");
    }
  }

  ////   =>  headlines api call
  Future<NewsChannelsHeadlinesModel> fetchNewsChannelsApi(
      String newsChannel) async {
    String Url = '$headlinesUrl${newsChannel}&apiKey=$Api_Key';

    final response = await http.get(Uri.parse(Url));

     return _handleApiResponse(response); 

   /*  if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());

      //
      return NewsChannelsHeadlinesModel.fromJson(data);
    } else {
      throw FetchDataException("hehe");
    } */
  }

 ///   =>  categories api call

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    String Url = '$categoriesUrl${category}&apiKey=$Api_Key';

    final response = await http.get(Uri.parse(Url));

    print(response);
    print(response.statusCode);

     return _handleApiResponse(response); 

    /* if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());

      //
      return CategoriesNewsModel.fromJson(data);
    } else {
      throw FetchDataException("hehe");
    } */
  }


  
}
