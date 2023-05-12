
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  var instance = FirebaseFirestore.instance;

  updateDocument(String docId, Map<String, dynamic> data) {
    instance.collection('memo').doc(docId).update(data);
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
                updateDocument('123456789', {'isFinished': true});
              },
              child: Text('문서 수정'),
            ),
          ],
        ),
      ),
    );
  }
}

