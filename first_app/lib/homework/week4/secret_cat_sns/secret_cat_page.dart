
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'author_screen.dart';
import 'secret_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecretCatPage extends StatefulWidget {
  const SecretCatPage({Key? key}) : super(key: key);

  @override
  State<SecretCatPage> createState() => _SecretCatPageState();
}

class _SecretCatPageState extends State<SecretCatPage> {

  int screenIdx = 0;
  List<Widget> screens = [SecretScreen(), AuthorScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('비밀듣는 고양이'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('비밀듣는 고양이 (SNS형)\n스나이퍼팩토리 교육용 앱'),
              ),
              SizedBox(height: 100),
              Divider(),
              ListTile(
                leading: Icon(FontAwesomeIcons.dev),
                title: Text('Teddy'),
              )
            ],
          ),
        ),
      ),
      body: screens[screenIdx],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return BottomSheet();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
          );
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          FontAwesomeIcons.cat,
          FontAwesomeIcons.peopleGroup,
        ],
        activeIndex: screenIdx,
        gapLocation: GapLocation.center,
        onTap: (tapIdx) {
          setState(() {
            screenIdx = tapIdx;
          });
        },
      ),
    );
  }
}

// bottom sheet
class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Padding(
      // 키보드 올라오면 bottom sheet 가려지지 않게 bottom padding 설정
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('비밀을 공유해볼까요?'),
              SizedBox(height: 20),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: '비밀을 입력하세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('공유하기'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  minimumSize: Size(double.infinity, 40)
                ),
                onPressed: (){
                  SecretCatApi.addSecret(textEditingController.text);
                  textEditingController.text = '';
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
