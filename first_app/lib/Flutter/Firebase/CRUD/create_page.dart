
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  var instance = FirebaseFirestore.instance;

  createDocument(String title) async {
    await instance
      .collection('memo')
      .add({'title': title, 'isFinished': false});
  }

  createDocumentById(String docId, String title) async {
    await instance
      .collection('memo')
      .doc(docId)
      .set({'title': title, 'isFinished': false});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                createDocument('햄버거먹기');
              },
              child: Text('문서 추가'),
            ),
            TextButton(
              onPressed: () {
                createDocumentById('123456789', '밥먹기');
              },
              child: Text('문서 추가(지정 아이디)'),
            ),
          ],
        ),
      ),
    );
  }
}

