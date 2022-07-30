import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio_rest_api/core/widget/drawer.dart';
import 'package:dio_rest_api/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("News Headline"),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.all(10),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.articles[index].urlToImage == null
                            ? Container()
                            : Image.network(
                                controller.articles[index].urlToImage),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          controller.articles[index].title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          controller.articles[index].description,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: controller.articles.length,
                ),
              );
      }),
    );
  }
}
