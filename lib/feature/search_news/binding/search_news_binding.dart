import 'package:dio_rest_api/feature/search_news/controller/search_news_controller.dart';
import 'package:get/get.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
