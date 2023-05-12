
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  var instance = FirebaseFirestore.instance;

  deleteDocument(String docId) {
    instance.collection('memo').doc(docId).delete();
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
                deleteDocument('123456789');
              },
              child: Text('문서 삭제'),
            ),
          ],
        ),
      ),
    );
  }
}

