
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  TextEditingController textController = TextEditingController();
  String hamText = '진짜\n나만 알고\n잇을게';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Stack(
                children: [
                  Image.asset('assets/images/secret_hamburger/UploadPage-burger.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 110.0, top: 20),
                    child: Align(
                      child: Text(hamText)
                    ),
                  )
                ]
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textController,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: '비밀을 말해보렴!!!',

                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  SecretCatApi.addSecret(textController.text);
                  textController.text = '';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('비밀 등록이 완료되었습니다.'),
                    ),
                  );
                  hamText = '헤헤\n뻥이지롱';
                  Future.delayed(Duration(milliseconds: 1500), () {
                    setState(() {
                      hamText = '진짜\n나만 알고\n잇을게';
                    });
                  });
                });
              },
              child: Text('비밀 등록'),),
            Spacer()
          ],
        ),
      ),
    );
  }
}

