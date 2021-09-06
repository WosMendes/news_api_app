import 'package:flutter/material.dart';
import 'package:my_news_app/components/newsListTile.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/service/news_api_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsApiService client = NewsApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, snapshot) {
          late List<Article> articles;
          if (snapshot.hasData) {
            articles = snapshot.data as List<Article>;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) => newsListTile(articles[index]),
            );
          }
          articles = [];
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
