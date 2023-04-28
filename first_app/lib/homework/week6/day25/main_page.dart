
import 'package:dio/dio.dart';
import 'post_item.dart';
import 'Post.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future<List<Post>> getData() async {
      Dio dio = Dio();
      var url = 'https://jsonplaceholder.typicode.com/posts';
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(response.data);
        return data.map((e) => Post.fromMap(e)).toList();
      }
      return [];
    }

    final int length = 5;   // 묶음당 post 개수

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!;
              return ListView.separated(
                itemCount: snapshot.data!.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) return Container();
                  return GestureDetector(
                    child: PostItem(post: data[index-1]),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return BottomSheet(post: data[index-1]);
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  int startIdx = index + 1;
                  int endIdx = startIdx + length - 1;

                  if ((index) % length == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Post $startIdx ~ $endIdx', style: TextStyle(fontSize: 26))
                    );
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

// bottom sheet
class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${post.title}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 16),
          Text('${post.body}'),
        ]
      ),
    );
  }
}
