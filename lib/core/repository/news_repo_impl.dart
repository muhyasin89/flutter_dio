import 'package:dio_rest_api/core/model/news_response.dart';
import 'package:dio_rest_api/core/repository/news_repo.dart';
import 'package:dio_rest_api/core/model/article.dart';
import 'package:dio_rest_api/feature/service/http_service.dart';
import 'package:dio_rest_api/feature/service/http_service_impl.dart';
import 'package:get/get.dart';

class NewsRepoImpl implements NewsRepo {
  HttpService _httpService;
  Response response;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest("v2/top-headlines?country=us");

      final parseResponse = NewsResponse.fromJson(response.data);

      return parseResponse.articles;
    } on Exception catch (e) {
      // TODO
      print(e);

      return null;
    }
  }

  @override
  Future<List<Article>> getSearchNews(String query) async {
    try {
      final response = await _httpService.getRequest("v2/everything?q=$query");

      final parseResponse = NewsResponse.fromJson(response.data);

      return parseResponse.articles;
    } on Exception catch (e) {
      // TODO
      print(e);

      return null;
    }
  }
}
