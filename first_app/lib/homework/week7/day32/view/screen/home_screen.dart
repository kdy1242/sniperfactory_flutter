
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/document.dart';
import '../../model/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.user, required this.documents}) : super(key: key);

  final User user;
  final RxList<Document> documents;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${user.username}님 안녕하세요', style: TextStyle(fontSize: 30)),
        SizedBox(height: 12),
        Obx(() => ListView.builder(
          shrinkWrap: true,
          itemCount: documents.length,
          itemBuilder: (context, index) {
            Document document = documents[index];
            return Column(
              children: [
                ListTile(
                  title: Text('${document.title}'),
                  subtitle: Text('${document.content}'),
                ),
                document.attachment_url != null
                  ? Image.network(document.attachment_url!) : Container()
              ],
            );
          },
        ))
      ],
    );
  }
}

