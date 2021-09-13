import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/pages/detail_page.dart';

Widget newsListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () => Get.to(() => DetailPage(article: article)),
    child: Card(
      elevation: 6.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          article.source.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  Text(article.publishedAt.substring(0, 10)),
                ],
              ),
            ),
            Container(
              height: 250,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              article.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
