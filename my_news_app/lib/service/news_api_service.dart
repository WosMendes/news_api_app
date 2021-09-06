import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_news_app/models/article_model.dart';

class NewsApiService {
  final endPointUrl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=br&apiKey=11def10e24c7445a93d32a48dee81469');

  Future<List<Article>> getArticle() async {
    Response response = await get(endPointUrl);

    if (response.statusCode == 200) {
      print('Sucess!');
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
