import 'package:flutter_application_1/model/NewsChannelHeadlinesModel.dart';
import 'package:flutter_application_1/model/categories_news_model.dart';
import 'package:flutter_application_1/repositories/news_repositoriy.dart';

class NewsViewModel {
  final repo = NewsRepository();

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelsApi(String name) async {
    final response = await repo.fetchNewsChannelsApi(name);
    return response;
  }

  ////

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    final response = await repo.fetchCategoriesNewsApi(category);
    return response;
  }
  /////////
}
