
import 'package:intl/intl.dart';

import 'Article.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    article.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(article.author),
                ),
                Row(
                  children: [
                    Text(article.type, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(' | ${DateFormat('dd MMM yyyy').format(article.createdAt)}'),
                  ],
                )
              ],
            ),
          ),
          Container(
              width: 100,
              child: Image.network(article.img)
          )
        ],
      ),
    );
  }
}

