
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {

  var instance = FirebaseFirestore.instance;
  List items = [];

  readFromCloudFireStore() async {
    var res = await instance.collection('memo').get();
    setState(() {
      items = res.docs.map((e) => e.data()).toList();
    });
  }

  getDocument(String documentId) async {
    var res = await instance.collection('memo').doc(documentId).get();
    print(res.data());
  }

  readFinishedDocuments() async {
    var res = await instance.collection('memo').where('isFinished', isEqualTo: true).get();
    print(res.docs);
    print(res.size);
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
              onPressed: readFromCloudFireStore,
              child: Text('가져오기'),
            ),
            TextButton(
              onPressed: () {
                getDocument('mbJD2cLGnswxos5BoOMD');
              },
              child: Text('하나만 가져오기'),
            ),
            TextButton(
              onPressed: () {
                readFinishedDocuments();
              },
              child: Text('finished만 가져오기'),
            ),
            if (items.isNotEmpty) ...items.map((e) => Text(e['title'])).toList()
          ],
        ),
      ),
    );
  }
}
