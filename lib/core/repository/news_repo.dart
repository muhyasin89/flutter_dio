import 'package:dio_rest_api/core/model/article.dart';

abstract class NewsRepo {
  Future<List<Article>> getNewsHeadline();
  Future<List<Article>> getSearchNews(String query);
}
