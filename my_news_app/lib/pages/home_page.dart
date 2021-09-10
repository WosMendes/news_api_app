import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/components/newsListTile.dart';
import 'package:my_news_app/controllers/language_controller.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/service/news_api_service.dart';

class HomePage extends StatelessWidget {
  final NewsApiService client = NewsApiService();
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${languageController.appTitle}')),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () => languageController.changeLanguage(),
            icon: Icon(Icons.language),
            label:
                Obx(() => Text('${languageController.language}'.toUpperCase())),
          ),
        ],
      ),
      body: GetX<LanguageController>(builder: (controller) {
        return FutureBuilder(
          future: client.getArticle(),
          builder: (BuildContext context, snapshot) {
            late List<Article> articles;
            if (snapshot.hasData) {
              articles = snapshot.data as List<Article>;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    newsListTile(articles[index], context),
              );
            }
            articles = [];
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      }),
    );
  }
}
