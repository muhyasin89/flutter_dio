import 'package:dio_rest_api/core/model/article.dart';
import 'package:dio_rest_api/core/repository/news_repo.dart';
import 'package:dio_rest_api/core/repository/news_repo_impl.dart';
import 'package:dio_rest_api/core/model/article.dart';
import 'package:get/get.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  RxList<Article> articles;

  loadNewsLine() async {
    showLoading();
    final result = await _newsRepo.getNewsHeadline();

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("Data Not Found");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
