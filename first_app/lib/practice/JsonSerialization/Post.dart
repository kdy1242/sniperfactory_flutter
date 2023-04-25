
import 'package:dio/dio.dart';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(userId: map['userId'], id: map['id'], title: map['title'], body: map['body']);
  }
}

Future<Post?> getData(int userId) async {
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/posts/$userId';
  var response = await dio.get(url);

  if (response.statusCode == 200) {
    return Post.fromMap(response.data);
  }
  return null;
}

void main() async {
  for (var i=1; i<10; i++) {
    var res = await getData(i);
    if (res != null) {
      print(res.title);
    }
  }
}
