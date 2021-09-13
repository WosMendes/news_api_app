import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:my_news_app/controllers/language_controller.dart';
import 'package:my_news_app/models/article_model.dart';

class NewsApiService {
  final languageController = Get.put(LanguageController());
  final String apiKey = dotenv.env['API_KEY'].toString();

  Future<List<Article>> getArticle() async {
    final endPointUrl = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=${languageController.language}&apiKey=$apiKey');

    var response = await get(endPointUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Artciles");
    }
  }
}
