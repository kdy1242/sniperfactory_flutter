
import 'data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'Article.dart';
import 'article_item.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    List<Article> articleList = articleData.map((e) => Article.fromMap(e)).toList();
    print(articleList.toString());

    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: articleList.length,
          itemBuilder: (context, index) {
            var article = articleList[index];
            return GestureDetector(
              child: ArticleItem(article: article),
              onTap: () {
                launchUrlString(article.url);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
