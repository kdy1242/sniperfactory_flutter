
import 'package:first_app/homework/week5/week5challenge/page/search_result_page.dart';
import 'package:flutter/material.dart';

import '../model/Email.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.emailList}) : super(key: key);

  final List<Email> emailList;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('메일 검색'),
        // TextField(
        //   decoration: InputDecoration(
        //     fillColor: Colors.grey[200],
        //     filled: true,
        //     border: OutlineInputBorder(
        //       borderSide: BorderSide.none,
        //     ),
        //     hintText: '메일 검색'
        //   ),
        // ),
        // actions: [
        //   TextButton(
        //     onPressed: (){},
        //     child: Text('상세'),
        //   )
        // ],
      ),
      body: ListView.builder(
        itemCount: widget.emailList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ListTile(
              title: Text('${widget.emailList[index].from}')
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResultPage(email: widget.emailList[index]))
              );
            },
          );
        }
      ),
    );
  }
}

