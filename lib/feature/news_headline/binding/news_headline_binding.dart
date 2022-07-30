import 'package:dio_rest_api/core/repository/news_repo_impl.dart';
import 'package:dio_rest_api/feature/news_headline/controller/news_headline_controller.dart';
import 'package:get/get.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }
}
